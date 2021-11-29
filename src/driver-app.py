#########################################################################
# driver-app.py
# Web app to test tachograph simulation
#########################################################################

import os
import shutil
import pandas as pd
import streamlit as st
import matplotlib as plt

# Visualization
from plot_utils import *

# Metrics
from displayed_metrics import *

# Subprocess
from subprocess_functions import *

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

DOMAIN_PATH = "hpdl/domain-zeno.pddl"

# -----------------------------------------------------------------------------
# Start tachograph simulation

start_simulation(DRIVER)

# TODO: Automatically refresh whenever tmp file changes
if st.button("Refresh?"):
    # -----------------------------------------------------------------------------
    # Generate HPDL problem
    with st.spinner("Preprocessing raw data for recognition..."):
        fromCSVtoPLAN(TACHO_PATH, PLAN_FOLDER_PATH)
        fromPLANtoPDDL(PLAN_DATA_PATH, PROBLEM_FOLDER_PATH)

    # TODO: CHECK PREFERENCES HERE

    # -----------------------------------------------------------------------------
    # Calling planner

    with st.spinner("Recognizing driver log..."):
        runPlanner(DOMAIN_PATH, PROBLEM_PATH, LOG_PATH)

    # -----------------------------------------------------------------------------
    # Clean log for driver

    cleanLog(LOG_PATH, CLEAN_LOG_FOLDER)

    # -----------------------------------------------------------------------------
    # Load data

    # TODO: Move this lines (loading of data) and subprocesses into functions
    df = pd.read_csv(CLEAN_LOG_PATH, sep="\t", dtype={"Day":int, "Duration(min)":int, "Week":int})

    # TODO: Change domain for zeno and include zeno primitives into problem
    df.loc[len(df)] = ["driver1","16/01/2017 00:24","16/01/2017 01:09",45,"Sug-Break",1,1,"ndd","first","split_2","B_T3","yes",None]
    df.loc[len(df)] = ["driver1","16/01/2017 01:09","16/01/2017 01:12",3,"Sug-Load",1,1,"ndd","second","uninterrupted","A","yes","box7"]
    df.loc[len(df)] = ["driver1","16/01/2017 01:12","16/01/2017 01:15",3,"Sug-Load",1,1,"ndd","second","uninterrupted","A","yes","box8"]
    df.loc[len(df)] = ["driver1","16/01/2017 01:15","16/01/2017 01:18",3,"Sug-Load",1,1,"ndd","second","uninterrupted","A","yes","box9"]
    df.loc[len(df)] = ["driver1","16/01/2017 01:18","16/01/2017 02:34",76,"Sug-Driving",1,1,"ndd","second","uninterrupted","A","yes","sevilla-cadiz"]

    # To timestamp format
    df.DateTimeStart = pd.to_datetime(df.DateTimeStart)
    df.DateTimeEnd = pd.to_datetime(df.DateTimeEnd)

    # Rename column
    df = df.rename(columns={"#Driver":"Driver", "Duration(min)":"Duration"})

    # To numerical
    df.Legal = df.Legal.map({"yes": 1, "no": 0}) # Not sure if [-1,1] is better

    # Separate suggestions in different DF
    df_sug = df[df.Activity.str.contains("Sug")]
    df_no_sug = df[~df.Activity.str.contains("Sug")]

    # Drop columns
    df_sug = df_sug.drop(columns=['ZenoInfo'])
    df_no_sug = df_no_sug.drop(columns=['ZenoInfo', "DateTimeStart", "DateTimeEnd"])

    # -----------------------------------------------------------------------------
    # Coloring for display
    # Today

    # Get last day of data
    max_days = int(df_no_sug['Day'].max())

    df_colored = df_no_sug.loc[df_no_sug['Day'] == max_days].drop(columns="Driver")
    df_colored.replace({"Legal": {1: 'Yes', 0: 'No'}}, inplace=True) # Rename Legal values to Yes/No
    df_colored = df_colored.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token", "Legal"])

    st.write("Tagged data", df_colored)

    # -----------------------------------------------------------------------------
    # Next recommendations

    # Get first day of data
    min_days = int(df_sug['Day'].min())

    df_colored = df_sug.loc[df_sug['Day'] == min_days].drop(columns=["Driver","Legal","DateTimeEnd", "Week", "Day"])
    df_colored = df_colored.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token"])

    st.write("Recommended Activities", df_colored)

    # -----------------------------------------------------------------------------
    # Get driver metrics
    metrics = get_displayed_metrics(df_no_sug, df_sug)

    # Print
    col1, col2, col3 = st.columns(3)

    col1.metric("Recommended Activity", metrics.NextActivityName)
    col2.metric("Starting Time", metrics.NextActivityStartTime)
    col3.metric("Ending Time", metrics.NextActivityEndTime)

    hours, minutes = format_time(metrics.DrivingTimeDay)
    col1.metric("Driving time today", "{}h {}m".format(hours, minutes))

    hours, minutes = format_time(metrics.RemainingDrivingTimeSequence)
    col2.metric("Time remaining before break", "{}h {}m".format(hours, minutes))

    col3.metric("Remaining EDD available", metrics.RemainingEDDs)

    # Plot remaining time
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
# ALSO: The stored driver metrics should be calculated each 2 weeks

# TODO: Investigate old driver data to get preferences when computing zeno actions