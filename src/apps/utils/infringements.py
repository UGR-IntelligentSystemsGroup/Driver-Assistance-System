# Detect and explain HOS infringements in driver log

# 1. Find days with illegal action
# 2. Verify constraints for each day (CAN'T, WE NEED ALL WEEK FOR SOME CONSTRAINTS)
# 3. Repair according to each illegality
# 4. Repeat 2 and 3 until no changes

# Infractions takes the form:
# (start, end, details)

def find_infringements(df):
    """Receives tagged driver log"""
    infringements = [] # List (starting_action_num, infringement_details)

    # Search week by week
    week_groups = df.groupby('Week', sort=False) # False to keep driver ordering
    for _, week_group in week_groups:

        remaining_edds = get_remaining_edds(week_group)

        infringements.append(missing_half_split_rest(week_group))

        # Search day by day
        day_groups = week_group.groupby('Day', sort=False)
        for _, day_group in day_groups:
            
            # Must be at least one illegality detected
            if 0 in day_group.Legal.values:
                infringements.extend([
                    rest_past_deadline(day_group),
                    excessive_driving_NDD(day_group, remaining_edds),
                    excessive_driving_EDD(day_group)
                ])

                infringements.extend(excessive_driving_seq(day_group))

    # Remove None from list
    infringements = [x for x in infringements if x is not None]

    # Call soft constraints if there are illegal sequences not yet recognized
    # if len(infringements) < get_num_illegal(df):
    #     infringements.extend(soft_constraints(df, PROBLEM_PATH, DRIVER))

    # Sort by activity index
    infringements.sort(key=lambda tup: tup[0]) # Sort by starting point

    return infringements
        

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------

def get_num_illegal(df):
    """Get the number of illegal sequences in a log"""
    groups = df.groupby('Day', sort=False) # False to keep driver ordering

    num = 0
    for _, group in groups:
        if "none" in group.values:
            num += 1

    return num

# -------------------------------------------------------------------------

# dt = Driving Time (minutes)
def get_dt(df):
    return df.loc[df.Activity == "Driving", "Duration"].sum()

# -------------------------------------------------------------------------

def get_remaining_edds(df):
    """Receives one week of data. Returns the number of remaining EDDs this week"""
    groups = df.groupby('Day', sort=False) # False to keep driver ordering

    num = 0
    for _, group in groups:
        if "edd" in group.values:
            num += 1

    return 2 - num

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------

# IF
#     Only 1 illegal action
#     DR/WR - Token
#     Legal tag - No
#     Rest tags - Not None
# THEN
#     Rest past the deadline

def rest_past_deadline(df):
    """Receives one day log"""
    details = "Rest past the deadline"
    infringement = None

    # Get illegal actions
    action = df.loc[df.Legal == 0]

    if len(action) == 1:
        print(df.Day.unique())

        has_dr = df.Token.str.contains("DR_", case=False).any()
        has_wr = df.Token.str.contains("WR_", case=False).any()
        
        if (has_dr or has_wr) and not "none" in action.values:
            infringement = (action.index, action.index, details)
    
    return infringement


# -------------------------------------------------------------------------

# IF
#     dt_day > 9h
#     No EDD remaining in weeks
# THEN
#     Excessive Driving in day (NDD)

def excessive_driving_NDD(df, remaining_edds):
    """Receives one day log"""
    details = "Excessive Driving in day (NDD)"
    infringement = None

    dt_day = get_dt(df)

    if dt_day > (9*60) and remaining_edds == 0:
        infringement = (df.index[0], df.index[-1], details)

    return infringement

# -------------------------------------------------------------------------

# IF
#     dt_day > 10h
# THEN
#     Excessive Driving in day (EDD)

def excessive_driving_EDD(df):
    """Receives one day log"""
    details = "Excessive Driving in day (NDD)"
    infringement = None

    dt_day = get_dt(df)

    if dt_day > (10*60):
        infringement = (df.index[0], df.index[-1], details)

    return infringement

# -------------------------------------------------------------------------

# IF
#     dt_seq > 4.5h
# THEN
#     Excessive Driving without breaks
#     (Excessive Driving in sequence)

def excessive_driving_seq(df):
    """Receives one day log. Find all sequences that verifies condition"""
    details = "Excessive Driving without breaks"
    infringement = []

    groups = df.groupby("Sequence", sort=False)

    for _, group in groups:
        dt_seq = get_dt(group)

        if dt_seq > (4.5*60):
            infringement.append((group.index[0], group.index[-1], details))

    return infringement

# -------------------------------------------------------------------------

# IF
#     DR_T3 day before
#     No DR_T4 or WR
# THEN
#     Missing other half of split daily rest

def missing_half_split_rest(df):
    """Receives week log"""
    details = "Missing other half of split daily rest"
    infringement = None

    has_drt3 = df.Token.str.contains("DR_T3", case=False).any()
    has_drt4 = df.Token.str.contains("DR_T4", case=False).any()
    has_wr   = df.Token.str.contains("WR_", case=False).any()

    if has_drt3 and not (has_drt4 or has_wr):
        index = df.index[0]

        # Find expected DR_T4 index
        groups = df.groupby('Day', sort=False) # False to keep driver ordering
        dr_t3_found = False
        for _, day in groups:
            if dr_t3_found:
                index = day.query("Activity == 'Break' & Token == 'none'").index[0]

            # Missing DR_T4 in next iteration
            if "DR_T3" in day.values:
                dr_t3_found = True

        infringement = (index, index, details)

    return infringement

# -------------------------------------------------------------------------

# If all prior functions fails to recognize the error
# Call domain with soft constraints and compare which tokens changes in the 
# problematic sequence

from genericpath import isfile
from numpy import True_
import pandas as pd
from os import remove
from os.path import isfile
from utils.subprocess_functions import runPlanner
import streamlit as st

@st.cache
def soft_constraints(df, PROBLEM_PATH, DRIVER):
    """Receives week log, PDDL problem path and driver ID"""
    DOMAIN_PATH = "hpdl/domain-soft.pddl"
    LOG_PATH = "tmp-soft-{}.csv".format(DRIVER)

    # -------------------------------------------------------------------------
    # Call planner
    runPlanner(DOMAIN_PATH, PROBLEM_PATH, LOG_PATH)

    # -------------------------------------------------------------------------
    # Compare tokens
    soft_df = pd.read_csv(LOG_PATH, sep="\t", comment="#")
    soft_df.columns = ["Driver","DateTimeStart","DateTimeEnd","Duration(min)",
                        "Activity","Week","Day","DayType","Sequence",
                        "BreakType","Token","Legal"] # Assign headers

    # Get tokens 
    index = df.query("Legal == 0").index
    # TODO: CHECK IF NO INDEX RETURNED
    soft_tokens = soft_df.loc[index-1].Token.reset_index(drop=True)
    actual_tokens = df.loc[index].Token.reset_index(drop=True)

    changes = soft_tokens != actual_tokens

    # -------------------------------------------------------------------------
    # Delete temporary file

    if isfile(LOG_PATH):
        remove(LOG_PATH)

    # -------------------------------------------------------------------------
    # Define infringements
    infringements = []
    details = "Possible borderline duration. {} should be {} to become legal"

    # TODO: Consider receiving list of previous infringement and don't show the new
    # detected that overlap

    # Get which activities are already explained in another infringement
    # activities = [x[0] for x in infringements]

    # Loop over values when changes is True
    for i, change, soft, actual in zip(index, changes, soft_tokens, actual_tokens):
        if change:
            infringements.append((i, i, details.format(actual, soft)))

    return infringements