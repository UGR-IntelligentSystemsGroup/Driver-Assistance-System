#!/usr/bin/python3
# -*- coding: utf-8 -*-

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
  """In Km"""
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
    # Calculate distance (km)
    df["Distance"] = df.apply(get_distance, axis=1)

    # Get previous and next status in each row
    df["previous_status"] = df.Status.shift(+1)
    df["next_status"] = df.Status.shift(-1)

    # Make sure we process rows from the same driver
    df["next_row_driver"] = df.Driver.shift(-1)

    # *************************************************************************
    # -------------------------------------------------------------------------
    # *************************************************************************
    # Query rows to eliminate

    # Remove consecutive break
    index = df.query("Status == 'Pausa' and next_status == 'Pausa' and Driver == next_row_driver").index

    # Calculate new rows
    to_delete = index.to_list()

    for i in index:
        actual = df.iloc[i] 
        next = df.iloc[i+1]

        # Start with the previous break row
        new_row = actual.copy()

        # Getting final metrics from next row
        new_row.HourEnd = next.HourEnd
        new_row.LatitudeEnd = next.LatitudeEnd
        new_row.LongitudeEnd = next.LongitudeEnd
        new_row.PlaceEnd = next.PlaceEnd
        new_row.MilometerEnd = next.MilometerEnd

        # New distance is the sum of the two rows
        new_row.Distance += next.Distance

        # The same with duration (NOTE: WE COULD REMOVE ACTUAL ROW DURATION)
        new_row.Duration = durationToMinutes(actual.Duration) + \
                            durationToMinutes(next.Duration)

        new_row.Duration = minutesToDuration(new_row.Duration)

        # Set next row with new row
        df.iloc[i+1, :] = new_row

    # Drop rows
    to_delete.sort()
    df.drop(index=to_delete, inplace=True)

    # Reset index
    df.reset_index(drop=True, inplace=True)

    # *************************************************************************
    # -------------------------------------------------------------------------
    # *************************************************************************
    # Second query

    # Actions between two breaks and with low distance movements
    # (Target situation: Parking the truck or moving it a short distance)
    index = df.query("Distance < 0.1 and previous_status == 'Pausa' and next_status == 'Pausa' and Driver == next_row_driver").index

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
        new_row.Distance += actual.Distance + next.Distance

        # The same with duration (NOTE: WE COULD REMOVE ACTUAL ROW DURATION)
        new_row.Duration = durationToMinutes(previous.Duration) + \
                            durationToMinutes(actual.Duration) + \
                            durationToMinutes(next.Duration)

        new_row.Duration = minutesToDuration(new_row.Duration)

        # Set next row with new row and indicate that previous row should be deleted
        df.iloc[i+1, :] = new_row
        to_delete.append(i-1)

    # Drop rows
    to_delete.sort()
    df.drop(index=to_delete, inplace=True)

    # *************************************************************************
    # -------------------------------------------------------------------------
    # *************************************************************************

    # Drop rows and columns
    df.drop(columns=["previous_status","next_status","next_row_driver"], inplace=True)

    # -------------------------------------------------------------------------
    # Save
    df.to_csv(OUTPUT_PATH, index=False)

###############################################################################
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
###############################################################################

if __name__ == "__main__":
    main(sys.argv)