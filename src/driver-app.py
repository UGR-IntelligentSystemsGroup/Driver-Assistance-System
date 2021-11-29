#########################################################################
# driver-app.py
# Web app to test tachograph simulation
#########################################################################

import os
import shutil
import subprocess
import pandas as pd
import streamlit as st
import matplotlib as plt

# Visualization
from plot_utils import *

# Metrics
from displayed_metrics import *

#########################################################################

st.title('Driver Functionality')
st.write("Simulating streaming of tachograph data")

# TODO: Improve. Put each driver in a folder and only delete that data
# Delete temporal folder if already exists
# try:
#     shutil.rmtree("tmp")
# except OSError:
#     pass

# # Create temporal directories
# os.mkdir("./tmp")
# os.mkdir("./tmp/problems")
# os.mkdir("./tmp/clean")
# os.mkdir("./tmp/plan")
# os.mkdir("./tmp/tagged")

# Create temporal directories that don't exists
if not os.path.isdir("./tmp"):
    os.mkdir("./tmp")

if not os.path.isdir("./tmp/clean"):
    os.mkdir("./tmp/clean")

if not os.path.isdir("./tmp/plan"):
    os.mkdir("./tmp/plan")

if not os.path.isdir("./tmp/tagged"):
    os.mkdir("./tmp/tagged")

if not os.path.isdir("./tmp/problems"):
    os.mkdir("./tmp/problems")

#########################################################################

# -----------------------------------------------------------------------------
# Get driver to simulate
st.sidebar.header("Configuration")
DRIVER = "driver" + str(st.sidebar.number_input('Select driver to simulate', 1, 290))

# Documentation
st.sidebar.subheader("Info")
link = '[Go to documentation](https://github.com/IgnacioVellido/IMLAP-Driver-Activity-Recognition/tree/main/doc/)'
st.sidebar.markdown(link, unsafe_allow_html=True)

# Paths
TACHO_PATH = "tmp/{}.csv".format(DRIVER)

PLAN_FOLDER_PATH = "tmp/plan"
PLAN_DATA_PATH = "tmp/plan/event-log-{}.plan".format(DRIVER)

PROBLEM_FOLDER_PATH = "tmp/problems"
PROBLEM_PATH = "{}/problem-{}.pddl".format(PROBLEM_FOLDER_PATH, DRIVER)

LOG_PATH = "tmp/tagged/tagged-log-{}.csv".format(DRIVER)

CLEAN_LOG_FOLDER = "tmp/clean"
CLEAN_LOG_PATH = "tmp/clean/clean-log-{}.csv".format(DRIVER)

# -----------------------------------------------------------------------------
# Start tachograph simulation

@st.cache()
def start_simulation():
    try:
        subprocess.Popen(['python', './src/stream_tachograph.py', DRIVER])
    except subprocess.CalledProcessError as err:
        print("Error while streaming tachograph data: " + err.stderr)



start_simulation()

# TODO: Automatically refresh whenever tmp file changes
if st.button("Refresh?"):
    # -----------------------------------------------------------------------------
    # Generate HPDL problem
    with st.spinner("Preprocessing raw data for recognition..."):
        try:
            subprocess.run(['python', './src/parsers/fromCSVtoPLAN.py', TACHO_PATH, PLAN_FOLDER_PATH])
        except subprocess.CalledProcessError as err:
            print("Error while parsing CSV to PLAN: " + err.stderr)

        try:
            subprocess.run(['python', './src/parsers/fromPLANtoPDDL.py', PLAN_DATA_PATH, PROBLEM_FOLDER_PATH])
        except subprocess.CalledProcessError as err:
            print("Error while parsing PLAN to PDDL: " + err.stderr)

    # TODO: CHECK PREFERENCES HERE

    # -----------------------------------------------------------------------------
    # Calling planner

    with st.spinner("Recognizing driver log..."):
        try:
            # Domain - Problem - Output
            subprocess.run(['bash', './src/scripts/runPlanner.sh', 'hpdl/domain.pddl', PROBLEM_PATH, LOG_PATH])
        except subprocess.CalledProcessError as err:
            print("Error while planning: " + err.stderr)

    # -----------------------------------------------------------------------------
    # Clean log for driver

    try:
        subprocess.run(['bash', './src/scripts/formatCSV.sh', LOG_PATH, CLEAN_LOG_FOLDER])
    except subprocess.CalledProcessError as err:
        print("Error while cleaning log: " + err.stderr)

    # -----------------------------------------------------------------------------
    # Load data

    # TODO: Move this lines and subprocesses into functions
    df = pd.read_csv(CLEAN_LOG_PATH, sep="\t", dtype={"Day":int, "Duration(min)":int, "Week":int})

    # To timestamp format
    df.DateTimeStart = pd.to_datetime(df.DateTimeStart)
    df.DateTimeEnd = pd.to_datetime(df.DateTimeEnd)

    # Rename column
    df = df.rename(columns={"#Driver":"Driver", "Duration(min)":"Duration"})

    # To numerical
    df.Legal = df.Legal.map({"yes": 1, "no": 0}) # Not sure if [-1,1] is better

    # Drop columns
    df = df.drop(columns=['ZenoInfo', "DateTimeStart", "DateTimeEnd"])

    # -----------------------------------------------------------------------------
    # Coloring for display

    df_colored = df.drop(columns="Driver")
    df_colored.replace({"Legal": {1: 'Yes', 0: 'No'}}, inplace=True) # Rename Legal values to Yes/No
    df_colored = df_colored.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token", "Legal"])

    st.subheader("Tagging")
    st.write("Tagged data", df_colored)

    # -----------------------------------------------------------------------------
    # Get driver metrics
    metrics = get_displayed_metrics(df)

    # Print
    col1, col2, col3 = st.columns(3)

    col1.metric("Recommended Action", metrics.NextActionName)
    col2.metric("Starting Time", metrics.NextActionStartTime)
    col3.metric("Ending Time", metrics.NextActionEndTime)

    # TODO: Move it to a function
    def plot_remaining_time(ax, min, remaining, title):
        ax.set_xticklabels([])
        ax.set_yticklabels([])    

        ax.set_theta_zero_location('N')
        ax.set_theta_direction(-1)

        max = min + remaining

        # Title
        hours = remaining // 60
        minutes = remaining % 60
        ax.set_title("Remaining {} time\n{}h {}m".format(title, hours, minutes), fontsize=11)

        ax.barh(np.radians(min), np.radians(max))

    fig, (ax1,ax2,ax3) = plt.subplots(1, 3, subplot_kw=dict(projection="polar"))

    plot_remaining_time(ax1, metrics.DrivingTimeSequence, metrics.RemainingDrivingTimeSequence, "SEQ")
    plot_remaining_time(ax2, metrics.DrivingTimeDay, metrics.RemainingDrivingTimeNDD, "NDD")
    plot_remaining_time(ax3, metrics.DrivingTimeDay, metrics.RemainingDrivingTimeEDD, "EDD")

    st.pyplot(fig)

    # text = 'Days processed<p style="font-size: 60px; font-weight:bold;">{}</p>'.format(max_days)
    # col1.markdown(text, unsafe_allow_html=True)

    # text = 'Illegal sequences detected<p style="color:#9E2A2B; font-size: 60px; font-weight:bold;">{}</p>'.format(illegal_seq)
    # col2.markdown(text, unsafe_allow_html=True)

    st.write(metrics.to_markdown())

# # -----------------------------------------------------------------------------
# # -----------------------------------------------------------------------------

# TODO: Process only last two weeks of data. The rest should be moved into another file
# The stored driver metrics should be calculated per 2 weeks

# TODO: Investigate old driver data to get preferences when computing zeno actions