#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os
import pandas as pd

# Visualization
from utils.plot_utils import *

# Subprocess
from utils.subprocess_functions import *

# Infringements
from utils.infringements import find_infringements

# Subprocess
from utils.subprocess_functions import *

for i in range(259,290):
    DRIVER = i

    # -----------------------------------------------------------------------------
    # Paths
    RAW_PATH = "./data/split/driver{}.csv".format(DRIVER)
    TACHO_PATH = "./out/preprocess/driver{}.csv".format(DRIVER)

    PLAN_FOLDER_PATH = "./out/plan"
    PLAN_DATA_PATH = "./out/plan/event-log-driver{}.plan".format(DRIVER)

    PROBLEM_FOLDER_PATH = "hpdl/problems"
    PROBLEM_PATH = "{}/problem-driver{}.pddl".format(PROBLEM_FOLDER_PATH, DRIVER)

    DOMAIN_PATH = "hpdl/domain.pddl"
    LOG_PATH = "out/tagged/tagged-log-driver{}.csv".format(DRIVER)

    CLEAN_LOG_FOLDER = "out/clean"
    CLEAN_LOG_PATH = "out/clean/clean-log-driver{}.csv".format(DRIVER)

    CENTROID_DESCRIPTION_PATH = "out/centroids_description.csv"

    INFRINGEMENTS_PATH = "out/infringements/inf-driver{}.csv".format(DRIVER)
    LOG_WITH_INF_PATH = "out/infringements/inf-log-driver{}.csv".format(DRIVER)

    if os.path.isfile(CLEAN_LOG_PATH):
        continue

    # Don't call again if PDDL already defined
    exist_pddl = os.path.isfile(PROBLEM_PATH)

    if not exist_pddl:
        preprocess(RAW_PATH, TACHO_PATH)
        fromCSVtoPLAN(TACHO_PATH, PLAN_FOLDER_PATH)
        fromPLANtoPDDL(PLAN_DATA_PATH, PROBLEM_FOLDER_PATH)
        exist_pddl = True


    # -----------------------------------------------------------------------------
    # Calling planner

    # Don't call again if log already tagged
    exist_tagged = os.path.isfile(LOG_PATH)

    # Also call when new pddl has been generated
    if not exist_tagged or not exist_pddl:
        runPlanner(DOMAIN_PATH, PROBLEM_PATH, LOG_PATH)
        exist_tagged = True


    # Load data
    def load_data():
        df = pd.read_csv(CLEAN_LOG_PATH, sep="\t", dtype={"Day":int, "Duration(min)":int})

        # To timestamp format
        df.DateTimeStart = pd.to_datetime(df.DateTimeStart)
        df.DateTimeEnd = pd.to_datetime(df.DateTimeEnd)

        # Rename column
        df = df.rename(columns={"#Driver":"Driver", "Duration(min)":"Duration"})

        # To numerical
        df.Legal = df.Legal.map({"yes": 1, "no": 0}) # Not sure if [-1,1] is better

        # Drop columns
        df = df.drop(columns=['ZenoInfo', "DateTimeStart", "DateTimeEnd"])

        return df


    # -----------------------------------------------------------------------------
    # Remove comments from driver log
    # -----------------------------------------------------------------------------

    # Next iteration if empty
    if not os.path.isfile(LOG_PATH):
        continue

    # Don't call again if log not modified
    reload_file = os.path.isfile(CLEAN_LOG_PATH) and not exist_tagged

    if not reload_file:
        cleanLog(LOG_PATH, CLEAN_LOG_FOLDER)

    df = load_data()

    #########################################################################
    # Display infringements
    #########################################################################

    infringements = find_infringements(df)

    # Default value for Infraction column
    df_with_inf = df.copy()
    df_with_inf["Infraction"] = "no"

    if infringements:

        for inf in infringements:
            text = "Activities [{} to {}]: {}".format(inf[0], inf[1], inf[2])

            # Add infraction to df
            df_with_inf["Infraction"][inf[0]:inf[1]+1] = inf[2]

        # Save to disk ------------------------------------------------------

        # Descriptions only
        df_inf = pd.DataFrame(infringements, columns=["Start","End","Details"])
        df_inf.to_csv(INFRINGEMENTS_PATH, index=False)

    # Indicate unidentified infractions in log
    mask = (df_with_inf.Legal == 0) & (df_with_inf.Infraction == "no")
    df_with_inf.loc[mask, 'Infraction'] =  "unidentified"

    # Save to disk log with infringements
    df_with_inf.to_csv(LOG_WITH_INF_PATH, index=False)