# Detect and explain HOS infringements in driver log

# 1. Find days with illegal action
# 2. Verify constraints for each day (CAN'T, WE NEED ALL WEEK FOR SOME CONSTRAINTS)
# 3. Repair according to each illegality
# 4. Repeat 2 and 3 until no changes

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

    # Sort by activity index
    infringements.sort(key=lambda tup: tup[1])

    return infringements
        

# -------------------------------------------------------------------------
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

    if len(action) == 1 and \
       action.Activity in ["DR", "WR"] and \
       not "none" in action.values:
        
        infringement = (action.index, details)
    
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
        infringement = (df.index[0], details)

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
        infringement = (df.index[0], details)

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
            infringement.append((group.index[0], details))

    return infringement

# -------------------------------------------------------------------------

# IF
#     DR_T3 day before
#     No DR_T4
# THEN
#     Missing other half of split daily rest

def missing_half_split_rest(df):
    """Receives week log"""
    details = "Missing other half of split daily rest"
    infringement = None

    if "DR_T3" in df.values and not "DR_T4" in df.values:
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

        infringement = (index, details)

    return infringement

# -------------------------------------------------------------------------

# IF
#     Tags - Good
#     Legal - No
# THEN
#     Some kind of weekly problem

# def unknown_weekly_problem(df):