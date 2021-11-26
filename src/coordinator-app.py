#########################################################################
# coordinator-app.py
# Web app to test Driver Recognition functionality
#########################################################################

import os
import subprocess
import pandas as pd
import streamlit as st
from joblib import load

# Visualization
from plot_utils import *

# Metrics
from get_driver_metrics import *

# Preprocessing
from sklearn.preprocessing import normalize

# D2V
from gensim.models.doc2vec import Doc2Vec

#########################################################################

st.title('Driver Activity Recognition')

# Create output directories that don't exists
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

# Paths
RAW_DATA_PATH = "./data/split/driver{}.csv".format(driver)

PLAN_FOLDER_PATH = "./out/plan"
PLAN_DATA_PATH = "./out/plan/event-log-driver{}.plan".format(driver)

PROBLEM_FOLDER_PATH = "hpdl/problems"
PROBLEM_PATH = "{}/problem-driver{}.pddl".format(PROBLEM_FOLDER_PATH, driver)

st.sidebar.subheader("Info")

# Documentation
link = '[Go to documentation](https://github.com/IgnacioVellido/IMLAP-Driver-Activity-Recognition/tree/main/doc/)'
st.sidebar.markdown(link, unsafe_allow_html=True)

# -----------------------------------------------------------------------------
# FROM CSV to PDDL

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
        try:
            subprocess.run(['python', './src/parsers/fromCSVtoPLAN.py', RAW_DATA_PATH, PLAN_FOLDER_PATH])
        except subprocess.CalledProcessError as err:
            print("Error while parsing CSV to PLAN: " + err.stderr)

        try:
            subprocess.run(['python', './src/parsers/fromPLANtoPDDL.py', PLAN_DATA_PATH, PROBLEM_FOLDER_PATH])
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

# Load data
@st.cache
def load_data(driver):
    df = pd.read_csv(CLEAN_LOG_PATH, sep="\t", dtype={"Day":int, "Duration(min)":int})

    # To timestamp format
    df.DateTimeStart = pd.to_datetime(df.DateTimeStart)
    df.DateTimeEnd = pd.to_datetime(df.DateTimeEnd)

    # Rename column
    df = df.rename(columns={"#Driver":"Driver", "Duration(min)":"Duration"})

    # To numerical
    df.Legal = df.Legal.map({"yes": 1, "no": 0}) # Not sure if [-1,1] is better

    # Drop columns
    df = df.drop(columns=['ZenoInfo', "DateTimeStart", "DateTimeEnd", 'Week'])

    return df

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# Clean log for driver

CLEAN_LOG_FOLDER = "out/clean"
CLEAN_LOG_PATH = "out/clean/clean-log-driver{}.csv".format(driver)

# Don't call again if log already cleaned
redo_file = os.path.isfile(CLEAN_LOG_PATH)

if not redo_file:
    try:
        subprocess.run(['bash', './src/scripts/formatCSV.sh' , LOG_PATH, CLEAN_LOG_FOLDER])
    except subprocess.CalledProcessError as err:
        print("Error while cleaning log: " + err.stderr)

df = load_data(driver)

# -----------------------------------------------------------------------------
# Coloring for display

df_colored = df.drop(columns="Driver")
df_colored.replace({"Legal": {1: 'Yes', 0: 'No'}}, inplace=True) # Rename Legal values to Yes/No
df_colored = df_colored.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token", "Legal"])

st.subheader("Tagging")
st.write("Tagged data", df_colored)

#########################################################################
# Display metrics
#########################################################################

# Get driver metrics
driver_metrics = get_metrics(driver, df)

max_days = driver_metrics.Days.loc[0]
illegal_seq = driver_metrics.Illegal.loc[0]

# Print
col1, col2 = st.columns(2)

text = 'Days processed<p style="font-size: 60px; font-weight:bold;">{}</p>'.format(max_days)
col1.markdown(text, unsafe_allow_html=True)

text = 'Illegal sequences detected<p style="color:#9E2A2B; font-size: 60px; font-weight:bold;">{}</p>'.format(illegal_seq)
col2.markdown(text, unsafe_allow_html=True)

st.write(driver_metrics)

#########################################################################
# Encode each column as numeric and join them
#########################################################################

@st.cache
def get_ordinalencoder_model():
    return load('src/models/ordinal_encoder.joblib')

# -------------------------------------------------------------------------

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
# -----------------------------------------------------------------------------

with st.spinner("Encoding log..."):
    corpus_lists = encode_data(df)

if st.sidebar.checkbox('Show encoded log'):
    st.write('Encoded log', corpus_lists)

#########################################################################
# Get embeddings
#########################################################################

def get_d2v_model():
    return Doc2Vec.load("src/models/doc2vec.bin")

# -----------------------------------------------------------------------------

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
# -----------------------------------------------------------------------------

with st.spinner("Getting D2V..."):
    X_d2v = get_d2v(corpus_lists)
    X_d2v = normalize(X_d2v)

#########################################################################
# Make KMeans predictions
#########################################################################

@st.cache
def get_kmeans_model():
    return load('src/models/kmeans.joblib')

# -----------------------------------------------------------------------------

@st.cache
def get_predictions(X_d2v):
    # Load KMeans
    kmeans = get_kmeans_model()

    clusters = kmeans.predict(X_d2v)

    # Get metrics
    # silhouette = silhouette_score(X_d2v, clusters)
    # ch = calinski_harabasz_score(X_d2v, clusters)
    # db = davies_bouldin_score(X_d2v, clusters)

    return clusters

# ------------------------------------------------------------------------------

def get_decoded_centroids_d2v():
    return pd.read_csv("out/centroids.csv", sep="\t", dtype={"Cluster": int})

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

with st.spinner("Clustering data..."):
    clusters = get_predictions(X_d2v)
    centroids = get_decoded_centroids_d2v()
    df_clusters = put_clusters_in_df(clusters, df)

# Rename Legal values to Yes/No
df_clusters.replace({"Legal": {1: 'Yes', 0: 'No'}}, inplace=True)
centroids.replace({"Legal": {1: 'Yes', 0: 'No'}}, inplace=True)

# Save predictions
PREDICTION_PATH = "out/clustering/clustered-log-driver{}.csv".format(driver)

if not os.path.isfile(PREDICTION_PATH):
    df_clusters.to_csv(PREDICTION_PATH, index=False)

#########################################################################
# Show results
#########################################################################

CENTROID_DESCRIPTION_PATH = "out/centroids_description.csv"
c_descriptions = pd.read_csv(CENTROID_DESCRIPTION_PATH)

# Get colored centroid and its description
def get_centroid(descriptions, centroids, num):
    description = descriptions[descriptions['Centroid'] == num].Description.iloc[0]

    centroid = centroids.loc[centroids['Cluster'] == centroid_num]
    centroid_colored = centroid.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token", "Legal"])

    return centroid_colored, description

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

st.subheader("Clustering")
st.pyplot(visualize_data(X_d2v, 'D2V', clusters))

# Select rows for day
day = st.number_input('Select driver day to display', 1, max_days)
df_day = df_clusters[df_clusters['Day'] == day].loc[:, df_clusters.columns != 'Driver']

# Drop Day column
df_day = df_day.drop(columns="Day")

# Color cells
df_colored = df_day.style.applymap(color_tagged_df, subset=["DayType", "Sequence", "BreakType", "Token", "Legal"])

# Get centroid and its description
centroid_num = df_day.Cluster.iloc[0]
centroid_colored, description = get_centroid(c_descriptions, centroids, centroid_num)

# ------------------------------------------------------------------------------

st.write("Clustered data for day {}".format(day), df_colored)
st.write("Centroid for cluster {}".format(centroid_num))
st.info(description)
st.write(centroid_colored)

# ------------------------------------------------------------------------------
# Show all centroids

if st.sidebar.checkbox("Show all centroids"):
    st.subheader("Centroids")

    centroid_num = st.number_input('Select centroid', 1, df_clusters['Cluster'].max())
    centroid_colored, description = get_centroid(c_descriptions, centroids, centroid_num)

    st.info(description)
    st.write(centroid_colored)