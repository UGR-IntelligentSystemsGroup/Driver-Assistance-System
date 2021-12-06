# displayed_metrics.py
# Functions to calculate the metrics the driver can see on-board

import pandas as pd

#########################################################################
# Displayed metrics (not stored)
#########################################################################
#  
# Remaining driving time for NDD (DR)
# Remaining driving time for EDD (DR)
# Remaining EDDs in week
# Hours driven this day
# Hours driven this week + Remaining for WR
# Hours driven this last two weeks + Remaining for BWR
# Remaining time for break
# Highlight next Activity (DRIVE/BREAK until HH:MM)
# 
# Recommended activities (TODO: In another DataFrame)
# 
#########################################################################

def get_displayed_metrics(df_no_sug, df_sug):
    """Receives tagged log without suggestions and log with only suggestions 
    containing maximum two weeks prior of historical data"""

    columns = ["NextActivityName", "NextActivityStartTime", "NextActivityEndTime",
                "DrivingTimeSequence", "DrivingTimeDay", "DrivingTimeWeek", "DrivingTimeBiWeek",
                "RemainingDrivingTimeSequence",
                "RemainingDrivingTimeNDD",
                "RemainingDrivingTimeEDD",
                "RemainingDrivingTimeWeek", "RemainingDrivingTimeBiWeek",
                "RemainingEDDs"
            ]

    # TODO: Get next Activity from log
    next_activity = str.replace(df_sug.Activity.iloc[0], "Sug-", "")
    next_activity_start = df_sug.DateTimeStart.iloc[0].strftime("%H:%M")
    next_activity_end = df_sug.DateTimeEnd.iloc[0].strftime("%H:%M")

    max_days = int(df_no_sug['Day'].max())
    max_week = int(df_no_sug['Week'].max())

    # Calculate Driving Times (minutes)
    dt_seq = get_dt_seq(df_no_sug.loc[df_no_sug['Day'] == max_days])
    dt_day = get_dt(df_no_sug.loc[df_no_sug['Day'] == max_days])
    dt_week = get_dt(df_no_sug.loc[df_no_sug['Week'] == max_week])
    dt_biweek = get_dt(df_no_sug)

    # Calculate Remaining Driving Times (minutes)
    r_dt_seq = int((4.5*60) - dt_seq)
    r_dt_ndd = (9*60) - dt_day
    r_dt_edd = (10*60) - dt_day
    r_dt_week = (56*60) - dt_week
    r_dt_biweek = (90*60) - dt_biweek

    r_edds = get_remaining_edds(df_no_sug.loc[df_no_sug['Week'] == max_week])

    # Appending driver row
    data = ([next_activity, next_activity_start, next_activity_end,
                        dt_seq, dt_day, dt_week, dt_biweek,
                        r_dt_seq, r_dt_ndd, r_dt_edd,
                        r_dt_week, r_dt_biweek, r_edds
    ])

    return pd.Series(data, index=columns)

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------

# dt = Driving Time (minutes)
def get_dt(df):
    return df.loc[df.Activity == "Driving", "Duration"].sum()


def get_dt_seq(df):
    """Get dt of last seq in day. Receives df with only a day"""

    # Get last day
    groups = df.groupby("Sequence")
    df_seq = groups.get_group(groups.last().iloc[-1].name)

    return get_dt(df_seq)

# -------------------------------------------------------------------------

def get_remaining_edds(df):
    """Receives one week of data. Returns the number of remaining EDDs this week"""
    groups = df.groupby('Day', sort=False) # False to keep driver ordering

    num = 0
    for _, group in groups:
        if "edd" in group.values:
            num += 1

    return 2 - num