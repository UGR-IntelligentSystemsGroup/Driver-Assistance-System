#########################################################################
# driver-app.py
# Web app to test tachograph simulation
#########################################################################

import os
import pandas as pd
import streamlit as st
import matplotlib as plt

# Visualization
from utils.plot_utils import *

# Metrics
from utils.displayed_metrics import get_displayed_metrics

# Subprocess
from utils.subprocess_functions import *

# Infringements
from utils.infringements import find_infringements

#########################################################################

def load_data(CLEAN_LOG_PATH):
    df = pd.read_csv(CLEAN_LOG_PATH, sep="\t", dtype={"Day":int, "Duration(min)":int, "Week":int}, keep_default_na=False)

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
    df_no_sug = df_no_sug.drop(columns=['ZenoInfo', "DateTimeStart", "DateTimeEnd"])

    return df_sug, df_no_sug

#########################################################################

st.title('Driver Functionality')
st.write("Simulating streaming of tachograph data")

# Create temporal directories that don't exists
if not os.path.isdir("./tmp"):
    os.mkdir("./tmp")

if not os.path.isdir("./tmp/preprocess"):
    os.mkdir("./tmp/preprocess")

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

show_all_suggestions = st.sidebar.checkbox("Show all recommended activities")

# Preferences (FOR TESTING PURPOSES)
change_preference = st.sidebar.checkbox("Change driver preferences")

# Documentation
st.sidebar.subheader("Info")
link = '[Go to documentation](https://github.com/IgnacioVellido/IMLAP-Driver-Activity-Recognition/tree/main/doc/)'
st.sidebar.markdown(link, unsafe_allow_html=True)

# -----------------------------------------------------------------------------
# Paths
RAW_PATH = "tmp/{}.csv".format(DRIVER)
TACHO_PATH = "tmp/preprocess/{}.csv".format(DRIVER)

PLAN_FOLDER_PATH = "tmp/plan"
PLAN_DATA_PATH = "tmp/plan/event-log-{}.plan".format(DRIVER)

PROBLEM_FOLDER_PATH = "tmp/problems"
PROBLEM_PATH = "{}/problem-{}.pddl".format(PROBLEM_FOLDER_PATH, DRIVER)

LOG_PATH = "tmp/tagged/tagged-log-{}.csv".format(DRIVER)

CLEAN_LOG_FOLDER = "tmp/clean"
CLEAN_LOG_PATH = "{}/clean-log-{}.csv".format(CLEAN_LOG_FOLDER, DRIVER)

DOMAIN_PATH = "hpdl/domain-zeno.pddl"

# -----------------------------------------------------------------------------
# Start tachograph simulation

start_simulation(DRIVER)

# TODO: Automatically refresh whenever tmp file changes
if st.button("Refresh?"):
    # -----------------------------------------------------------------------------
    # Generate HPDL problem
    with st.spinner("Preprocessing raw data for recognition..."):
        preprocess(RAW_PATH, TACHO_PATH)
        fromCSVtoPLAN(TACHO_PATH, PLAN_FOLDER_PATH)
        fromPLANtoPDDL(PLAN_DATA_PATH, PROBLEM_FOLDER_PATH)

        # TODO: Add Zenotravel predicates to problem
        # It should receive a ID for an entry in a database indicating the route to process.
        # The script should read the entry, transform it into HPDL predicates, add constant
        # information and append it into the existing problem

        # NOTE: For the moment, I'll read the predicates from a file and append it
        # First two lines goes to the object section, the rest into the init
        ZENO_PATH = "hpdl/zeno-primitives/problem1.pddl"
        addingZenoToPDDL(PROBLEM_PATH, ZENO_PATH, DRIVER)

    # -----------------------------------------------------------------------------
    # TODO: CHECK PREFERENCES and change domain if necessary 
    # (could be as simple as a query to a driver database)
    # preferences = get_preferences(DRIVER)

    if change_preference:
        changePreferences(DOMAIN_PATH) #, preferences)
        DOMAIN_PATH = "hpdl/domain-zeno2.pddl"
        # NOTE: This shouldn't be done like this.
        # A domain copy should be stored in the tmp directory with either the original
        # domain or the reordered one.

    # -----------------------------------------------------------------------------
    # Calling planner

    with st.spinner("Recognizing driver log..."):
        runPlanner(DOMAIN_PATH, PROBLEM_PATH, LOG_PATH)

    # -----------------------------------------------------------------------------
    # Clean log for driver

    cleanLog(LOG_PATH, CLEAN_LOG_FOLDER)

    # -----------------------------------------------------------------------------
    # Load data

    df_sug, df_no_sug = load_data(CLEAN_LOG_PATH)

    # -----------------------------------------------------------------------------
    # Coloring for display - Today

    # Get last day of data
    max_days = int(df_no_sug['Day'].max())

    df_colored = df_no_sug.loc[df_no_sug['Day'] == max_days].drop(columns="Driver")
    df_colored.replace({"Legal": {1: 'Yes', 0: 'No'}}, inplace=True) # Rename Legal values to Yes/No
    df_colored = df_colored.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token", "Legal"])

    st.write("Tagged data", df_colored)

    # -----------------------------------------------------------------------------
    # Infringements
    st.subheader("Infringements")

    infringements = find_infringements(df_no_sug, PROBLEM_PATH, DRIVER)
    illegal_seq = True if "none" in df_no_sug.values else False

    if infringements:
        for inf in infringements:
            text = "Activity {}: {}".format(inf[0],inf[1])
        
            # If not warning
            if "Possible" in text:
                st.warning(text)
            else:
                st.error(text)
                
    elif illegal_seq:
        st.warning("Infringements cause not identified")
    else:
        st.info("No infringements detected")

    # -----------------------------------------------------------------------------
    # Coloring for display - Next recommendations
    st.subheader("Recommended Activities")

    # Get first day of data
    min_days = int(df_sug['Day'].min())

    df_colored = df_sug.loc[df_sug['Day'] == min_days].drop(columns=["Driver","Legal","DateTimeEnd", "Week", "Day"])
    df_colored = df_colored.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token"])

    st.write(df_colored)

    if show_all_suggestions:
        st.write("All recommended activities", df_sug)

    # -----------------------------------------------------------------------------
    # Get driver metrics
    st.subheader("Status")
    metrics = get_displayed_metrics(df_no_sug, df_sug)

    # Print
    col1, col2, col3 = st.columns(3)

    emojis = {
        "Driving": ":truck:",
        "Break": ":tent:",
        "Load": ":package:",
        "Unload": ":package:"
    }
    next_activity = metrics.NextActivityName
    emoji = emojis[next_activity]

    text = 'Recommended Activity<p style="font-size: 30px;">{} {}</p>'.format(next_activity, emoji)
    col1.markdown(text, unsafe_allow_html=True)

    # col1.metric("Recommended Activity", next_activity + emoji)
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

    st.write(metrics.to_markdown())