#########################################################################
# driver-app.py
# Web app to test tachograph simulation
#########################################################################

import os
import subprocess
import pandas as pd
import streamlit as st

# Visualization
from plot_utils import *

# Metrics
from get_driver_metrics import *

#########################################################################

st.title('Driver Functionality')
st.write("Simulating tachograph data streaming")

# Create temporal directories that don't exists
if not os.path.isdir("./tmp"):
    os.mkdir("./tmp")

if not os.path.isdir("./tmp/clean"):
    os.mkdir("./tmp/clean")

if not os.path.isdir("./tmp/plan"):
    os.mkdir("./tmp/plan")

if not os.path.isdir("./tmp/tagged"):
    os.mkdir("./tmp/tagged")

#########################################################################

# -----------------------------------------------------------------------------
# Get driver to simulate
st.sidebar.header("Configuration")
DRIVER = "driver" + st.sidebar.number_input('Select driver to simulate', 1, 290)

# Documentation
st.sidebar.subheader("Info")
link = '[Go to documentation](https://github.com/IgnacioVellido/IMLAP-Driver-Activity-Recognition/tree/main/doc/)'
st.sidebar.markdown(link, unsafe_allow_html=True)

# Paths
TACHO_PATH = "./tmp/{}.csv".format(DRIVER)
PLAN_FOLDER_PATH = "./out/plan"
PLAN_DATA_PATH = "./tmp/plan/event-log-driver{}.plan".format(DRIVER)
PROBLEM_FOLDER_PATH = "hpdl/problems".format(DRIVER)
PROBLEM_PATH = "hpdl/problems/problem-driver{}.pddl".format(DRIVER)

# -----------------------------------------------------------------------------
# Start tachograph simulation

try:
    subprocess.Popen(['python', './src/stream_tachograph.py', DRIVER])
except subprocess.CalledProcessError as err:
    print("Error while streaming tachograph data: " + err.stderr)

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