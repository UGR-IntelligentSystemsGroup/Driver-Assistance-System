# subprocess_functions.py
# Functions calling different process

import subprocess
import streamlit as st

#########################################################################

@st.cache()
def start_simulation(DRIVER):
    try:
        subprocess.Popen(['python', './src/stream_tachograph.py', DRIVER])
    except subprocess.CalledProcessError as err:
        print("Error while streaming tachograph data: " + err.stderr)

# -----------------------------------------------------------------------------

def fromCSVtoPLAN(TACHO_PATH, PLAN_FOLDER_PATH):
    try:
        subprocess.run(['python', './src/parsers/fromCSVtoPLAN.py', TACHO_PATH, PLAN_FOLDER_PATH])
    except subprocess.CalledProcessError as err:
        print("Error while parsing CSV to PLAN: " + err.stderr)

# -----------------------------------------------------------------------------

def fromPLANtoPDDL(PLAN_DATA_PATH, PROBLEM_FOLDER_PATH):
    try:
        subprocess.run(['python', './src/parsers/fromPLANtoPDDL.py', PLAN_DATA_PATH, PROBLEM_FOLDER_PATH])
    except subprocess.CalledProcessError as err:
        print("Error while parsing PLAN to PDDL: " + err.stderr)

# -----------------------------------------------------------------------------

def runPlanner(DOMAIN_PATH, PROBLEM_PATH, LOG_PATH):
    try:
        # Domain - Problem - Output
        subprocess.run(['bash', './src/scripts/runPlanner.sh', DOMAIN_PATH, PROBLEM_PATH, LOG_PATH])
    except subprocess.CalledProcessError as err:
        print("Error while planning: " + err.stderr)

# -----------------------------------------------------------------------------

def cleanLog(LOG_PATH, CLEAN_LOG_FOLDER):
    try:
        subprocess.run(['bash', './src/scripts/formatCSV.sh', LOG_PATH, CLEAN_LOG_FOLDER])
    except subprocess.CalledProcessError as err:
        print("Error while cleaning log: " + err.stderr)

# -----------------------------------------------------------------------------

def addingZenoToPDDL(PROBLEM_PATH, ZENO_PATH):
    try:
        subprocess.run(['python', './src/scripts/addZenoToPDDL.py', PROBLEM_PATH, ZENO_PATH])
    except subprocess.CalledProcessError as err:
        print("Error while parsing PLAN to PDDL: " + err.stderr)