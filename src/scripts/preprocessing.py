#!/usr/bin/python3
# -*- coding: utf-8 -*-

# ###############################
# Preprocessing
# ###############################
# Calculate coordinates
# https://stackoverflow.com/questions/365826/calculate-distance-between-2-gps-coordinates
# Use Latitud,Longitud current row and NEXT ROW
# 
# REMOVE IF distance < 100m AND (duration < 3 min OR other OR idle)
# A unas malas perdemos algún delivery en la misma calle

import sys
import numpy as np
import pandas as pd
from datetime import timedelta

###############################################################################
# Functions
###############################################################################

# Add distance column
# https://stackoverflow.com/questions/365826/calculate-distance-between-2-gps-coordinates
def degreesToRadians(degrees):
  return degrees * np.pi / 180

def distanceInKmBetweenEarthCoordinates(lat1, lon1, lat2, lon2):
  earthRadiusKm = 6371

  dLat = degreesToRadians(lat2-lat1)
  dLon = degreesToRadians(lon2-lon1)

  lat1 = degreesToRadians(lat1)
  lat2 = degreesToRadians(lat2)

  a = np.sin(dLat/2) * np.sin(dLat/2) + np.sin(dLon/2) * np.sin(dLon/2) * np.cos(lat1) * np.cos(lat2)
  c = 2 * np.arctan2(np.sqrt(a), np.sqrt(1-a))

  return earthRadiusKm * c


def get_distance(row):
  return distanceInKmBetweenEarthCoordinates(row.LatitudeStart, row.LongitudeStart,
                                             row.LatitudeEnd, row.LongitudeEnd)

# -----------------------------------------------------------------------------

# Change format of latitude/longitude
def fix_latitude(l):
    return (l/(10**6))

def fix_longitude(l):
    return -(l/(10**6))

# -----------------------------------------------------------------------------

def durationToMinutes(duration):
    """devuelve la duración en minutos de una cadena de tipo "HH:MM"""
    duration = duration.replace("h", "")
    duration = duration.replace("m", "")
    duration = duration.split(" ")

    return timedelta(hours=int(duration[0]), minutes=int(duration[1]))

def minutesToDuration(duration):
    minutes = int(duration.total_seconds() // 60)

    hours = int(minutes // 60)
    minutes = int(minutes - (hours * 60))

    return "{}h {}m".format(hours, minutes)

###############################################################################
# Main
###############################################################################

# Arguments:
# Path to dataset
# Output path
def main(argv):
    INPUT_PATH = argv[1]
    OUTPUT_PATH = argv[2]

    df = pd.read_csv(INPUT_PATH)

    # -------------------------------------------------------------------------
    # Comment this lines when code is public 
    # (this is needed due to a mistake in our data)

    # Lag longitude
    df['LongitudeEnd(WRONG)'] = df.LongitudeStart.shift(-1)

    # Rename LongitudEnd(Wrong)
    df.rename(columns={"LongitudeEnd(WRONG)": "LongitudeEnd"}, inplace=True)

    df.LatitudeStart  = df.LatitudeStart.apply(fix_latitude)
    df.LatitudeEnd    = df.LatitudeEnd.apply(fix_latitude)
    df.LongitudeStart = df.LongitudeStart.apply(fix_longitude)
    df.LongitudeEnd   = df.LongitudeEnd.apply(fix_longitude)

    # -------------------------------------------------------------------------
    # Calculate distance (km)
    df["Distance"] = df.apply(get_distance, axis=1)

    # Get previous and next status in each row
    df["previous_status"] = df.Status.shift(+1)
    df["next_status"] = df.Status.shift(-1)

    # *************************************************************************
    # -------------------------------------------------------------------------
    # *************************************************************************
    # Query rows to eliminate

    # df.query("Distance < 0.1 and (Status == 'Espera' or Status == 'Otro trabajo')")
    index = df.query("Distance < 0.1 and previous_status == 'Pausa' and next_status == 'Pausa'").index

    # -------------------------------------------------------------------------
    # Calculate new rows
    to_delete = index.to_list()

    for i in index:
        previous = df.iloc[i-1]
        actual = df.iloc[i] 
        next = df.iloc[i+1]

        # Start with the previous break row
        new_row = previous.copy()

        # Getting final metrics from next row
        new_row.HourEnd = next.HourEnd
        new_row.LatitudeEnd = next.LatitudeEnd
        new_row.LongitudeEnd = next.LongitudeEnd
        new_row.PlaceEnd = next.PlaceEnd
        new_row.MilometerEnd = next.MilometerEnd

        # New distance is the sum of the three rows
        new_row.Distance += actual.Distance + new_row.Distance

        # The same with duration (NOTE: WE COULD REMOVE ACTUAL ROW DURATION)
        new_row.Duration = durationToMinutes(previous.Duration) + \
                            durationToMinutes(actual.Duration) + \
                            durationToMinutes(next.Duration)

        new_row.Duration = minutesToDuration(new_row.Duration)

        # Set next row with new row and indicate that previous row should be deleted
        df.iloc[i+1, :] = new_row
        to_delete.append(i-1)

    to_delete.sort()

    # -------------------------------------------------------------------------
    # Drop rows and columns
    df.drop(index=to_delete, inplace=True)
    df.drop(columns=["previous_status","next_status"], inplace=True)

    # -------------------------------------------------------------------------
    # Save
    df.to_csv(OUTPUT_PATH, index=False)

###############################################################################
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
###############################################################################

if __name__ == "__main__":
    main(sys.argv)