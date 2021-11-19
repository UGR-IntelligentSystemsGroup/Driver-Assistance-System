# Requirements:
# gensim
# streamlit
# pandas
# numpy
# sklearn

#########################################################################

import os
import subprocess
import pandas as pd
import streamlit as st
from joblib import load

# Visualization
from plot_utils import *

# Preprocessing
from sklearn.preprocessing import normalize

# D2V
from gensim.models.doc2vec import Doc2Vec

#########################################################################

st.title('Driver Activity Recognition')

# Create output directories that doesn't exists
if not os.path.isdir("./out"):
    os.mkdir("./out")

if not os.path.isdir("./out/clean"):
    os.mkdir("./out/clean")

if not os.path.isdir("./out/clustering"):
    os.mkdir("./out/clustering")

if not os.path.isdir("./out/plan"):
    os.mkdir("./out/plan")

if not os.path.isdir("./out/tagged"):
    os.mkdir("./out/tagged")

#########################################################################
# Recognition
#########################################################################

# -----------------------------------------------------------------------------
# Get driver to predict and centroid to display
st.sidebar.header("Configuration")
driver = st.sidebar.number_input('Select driver log', 1, 290)
st.sidebar.subheader("Info")

# TODO: Button to use all logs
# LOG_DATA_PATH = "./out/tagged/tagged-combined-log.csv"

RAW_DATA_PATH = "./data/split/driver{}.csv".format(driver)
PLAN_DATA_PATH = "./out/plan/event-log-driver{}.plan".format(driver)
PROBLEM_PATH = "hpdl/problems/problem-driver{}.pddl".format(driver)

# Don't call again if PDDL already defined
redo_file = os.path.isfile(PROBLEM_PATH)

# Let the user decide if redefine the PDDL problem
button = st.sidebar.empty()
if redo_file:
    if button.button('PDDL problem already exists. Redo?'):
        redo_file = False
        button.empty()

if not redo_file:
    with st.spinner("Preprocessing raw data for recognition..."):
        # -----------------------------------------------------------------------------
        # FROM CSV to PDDL
        try:
            subprocess.run(['python', './src/parsers/fromCSVtoPLAN.py' , RAW_DATA_PATH])
        except subprocess.CalledProcessError as err:
            print("Error while parsing CSV to PLAN: " + err.stderr)

        try:
            subprocess.run(['python', './src/parsers/fromPLANtoPDDL.py' , PLAN_DATA_PATH])
        except subprocess.CalledProcessError as err:
            print("Error while parsing PLAN to PDDL: " + err.stderr)

# -----------------------------------------------------------------------------
# Calling planner

LOG_PATH = "out/tagged/tagged-log-driver{}.csv".format(driver)

# Don't call again if log already tagged
redo_file = os.path.isfile(LOG_PATH)
button = st.sidebar.empty()

if redo_file:
    if button.button('Log already tagged. Redo?'):
        redo_file = False
        button.empty()

if not redo_file:
    with st.spinner("Recognizing driver log..."):
        try:
            # Domain - Problem - Output
            subprocess.run(['bash', './src/scripts/runPlanner.sh', 'hpdl/domain.pddl', PROBLEM_PATH, LOG_PATH])
        except subprocess.CalledProcessError as err:
            print("Error while planning: " + err.stderr)

if st.sidebar.checkbox("Show original data"):
    df_original = pd.read_csv(RAW_DATA_PATH)
    st.write("Raw data", df_original)
    
#########################################################################
# Clustering
#########################################################################

#########################################################################
# Load data

@st.cache
def load_data(driver):
    df = pd.read_csv(CLEAN_LOG_PATH, sep="\t", dtype={"Day":int})

    # To timestamp format
    df.DateTimeStart = pd.to_datetime(df.DateTimeStart)
    df.DateTimeEnd = pd.to_datetime(df.DateTimeEnd)

    # Rename column
    df = df.rename(columns={"#Driver":"Driver", "Duration(min)":"Duration"})

    # To numerical
    df.Legal = df.Legal.map({"yes": 1, "no": 0}) # Not sure if [-1,1] is better

    # Drop columns
    df = df.drop(columns=['Duration', 'ZenoInfo', "DateTimeStart", "DateTimeEnd", 'Week'])

    return df

# -----------------------------------------------------------------------------

# Clean log for driver
CLEAN_LOG_PATH = "out/clean/clean-log-driver{}.csv".format(driver)

# Don't call again if log already cleaned
redo_file = os.path.isfile(CLEAN_LOG_PATH)

if not redo_file:
    try:
        subprocess.run(['bash', './src/scripts/formatCSV.sh' , LOG_PATH])
    except subprocess.CalledProcessError as err:
        print("Error while planning: " + err.stderr)

df = load_data(driver)

st.subheader("Tagging")
st.write("Tagged data", df)

#########################################################################
# Transform data
# Encode each column as numeric and group them
#########################################################################

@st.cache
def get_ordinalencoder_model():
    return load('src/model/ordinal_encoder.joblib')

# The encoded columns are:
# Activity - DayType - Sequence - BreakType - Token - Legal
@st.cache
def encode_data(df):
    # Reorder columns
    cols = ['Driver', 'Day', 'Activity', 'DayType', 'Sequence', 'BreakType', 'Token', 'Legal']
    df = df[cols]

    x = df.to_numpy()

    # Encode into ordinal numbers
    ordinalencoder_X = get_ordinalencoder_model()
    x[:,2:] = ordinalencoder_X.transform(x[:,2:])

    df_encoded = pd.DataFrame(x, columns=cols)

    # Group columns into one (as string)
    df_encoded['Encoding'] = df_encoded[df_encoded.columns[2:]].apply(
                                lambda x: '-'.join(x.dropna().astype(str)),
                                axis=1
                            )

    # Remove encoded columns
    df_encoded = df_encoded[['Driver','Day','Encoding']]

    # -------------------------------------------------------------------------
    # Group activities by day and join them in a list

    # For each driver append all Encodings of one Day into a list
    groups = df_encoded.groupby('Driver', sort=False) # False to keep driver ordering

    # Each sentence is the sequence of activities in a day
    corpus_lists = []

    for name, group in groups:
        a = group.drop(columns='Driver')
        g = a.groupby('Day').cumcount()
        L = (a.set_index(['Day',g])
                .stack().groupby(level=0)
                .apply(lambda x: x.values))

        corpus_lists.extend(L)

    return corpus_lists

# -----------------------------------------------------------------------------

with st.spinner("Encoding log..."):
    corpus_lists = encode_data(df)

if st.sidebar.checkbox('Show encoded log'):
    st.write('Encoded log', corpus_lists)

#########################################################################
# Get embeddings
#########################################################################

def get_d2v_model():
    return Doc2Vec.load("src/model/doc2vec.bin")

# Paragraph Vector (Doc2Vec)
@st.cache
def get_d2v(corpus_lists):
    # Load model
    doc2vec = get_d2v_model()

    # Get embedding for each document
    embeddings_d2v = []

    for sentence in corpus_lists:
        embeddings_d2v.append(
            doc2vec.infer_vector(sentence)
        )

    return embeddings_d2v

# -----------------------------------------------------------------------------

with st.spinner("Getting D2V..."):
    X_d2v = get_d2v(corpus_lists)
    X_d2v = normalize(X_d2v)

#########################################################################
# Make KMeans predictions
#########################################################################

@st.cache
def get_kmeans_model():
    return load('src/model/kmeans.joblib')

@st.cache
def get_predictions(X_d2v):
    # Load KMeans
    kmeans = get_kmeans_model()

    clusters = kmeans.predict(X_d2v)

    # Get metrics
    # silhouette = silhouette_score(X, clusters)
    # ch = calinski_harabasz_score(X, clusters)
    # db = davies_bouldin_score(X, clusters)

    return clusters

# ------------------------------------------------------------------------------

def get_decoded_centroids_d2v():
    return pd.read_csv("out/centroids.csv", sep="\t", dtype={"Cluster": int})

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

with st.spinner("Clustering data..."):
    clusters = get_predictions(X_d2v)
    decoded_centroids = get_decoded_centroids_d2v()
    df_clusters = put_clusters_in_df(clusters, df)

# Rename Legal values to Yes/No
decoded_centroids.replace({"Legal": {1: 'Yes', 0: 'No'}}, inplace=True)

# Save predictions
PREDICTION_PATH = "out/clustering/clustered-log-driver{}.csv".format(driver)

if not os.path.isfile(PREDICTION_PATH):
    df_clusters.to_csv(PREDICTION_PATH, index=False)

#########################################################################
# Show results
#########################################################################

st.subheader("Clustering")
st.pyplot(visualize_data(X_d2v, 'D2V', clusters))

# Select rows for day
day = st.number_input('Select driver day to display', 1, df['Day'].max())
df_day = df_clusters[df_clusters['Day'] == day].loc[:, df_clusters.columns != 'Driver']

# Show centroid for selected day
centroid_num = df_day.Cluster.iloc[0]
centroid = decoded_centroids.loc[decoded_centroids['Cluster'] == centroid_num]

# Color cells
df_colored = df_day.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token", "Legal"])
centroid_colored = centroid.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token", "Legal"])

# Get centroid description
CENTROID_DESCRIPTION_PATH = "out/centroids_description.csv"
c_descriptions = pd.read_csv(CENTROID_DESCRIPTION_PATH)
description = c_descriptions[c_descriptions['Centroid'] == centroid_num].Description.iloc[0]

# ------------------------------------------------------------------------------

st.write("Clustered data for day", df_colored)
st.write("Centroid")
st.info(description)
st.write(centroid_colored)

# ------------------------------------------------------------------------------
# Show all centroids

if st.sidebar.checkbox("Show all centroids"):
    st.subheader("Centroids")

    centroid_num = st.number_input('Select centroid', 1, df_clusters['Cluster'].max())
    centroid = decoded_centroids.loc[decoded_centroids['Cluster'] == centroid_num]

    st.write("Centroid", centroid)