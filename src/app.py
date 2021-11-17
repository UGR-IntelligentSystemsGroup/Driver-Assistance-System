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
if os.path.isdir("./out"):
  os.mkdir("./out")

if os.path.isdir("./out/clean"):
  os.mkdir("./out/clean")

if os.path.isdir("./out/clustering"):
  os.mkdir("./out/clustering")

if os.path.isdir("./out/pan"):
  os.mkdir("./out/plan")

if os.path.isdir("./out/tagged"):
  os.mkdir("./out/tagged")

#########################################################################
# Recognition
#########################################################################

# -----------------------------------------------------------------------------
# Get driver to predict
driver = st.number_input('Select driver log', 1, 290)

RAW_DATA_PATH = "./data/split/driver{}.csv".format(driver)
PLAN_DATA_PATH = "./out/plan/event-log-driver{}.plan".format(driver)
PROBLEM_PATH = "hpdl/problems/problem-driver{}.pddl".format(driver)

# Don't call again if PDDL already defined
redo_file = os.path.isfile(PROBLEM_PATH)

# Let the user decide if redefine the PDDL problem
button = st.empty()
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
button = st.empty()

if redo_file:
  if button.button('Log already tagged. Redo?'):
    redo_file = False
    button.empty()

if not redo_file:
  with st.spinner("Recognizing driver log..."):
    try:
      # Domain - Problem - Output
      subprocess.run(['bash', './src/runPlanner.sh', 'hpdl/domain.pddl', PROBLEM_PATH, LOG_PATH])
    except subprocess.CalledProcessError as err:
      print("Error while planning: " + err.stderr)

#########################################################################
# Clustering
#########################################################################


#########################################################################
# Load data


@st.cache
def load_data(driver):
    df = pd.read_csv(CLEAN_LOG_PATH, sep="\t")

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

# TODO: Button to use all logs
# DATA_PATH = "./out/logs-recognition/combined-log.csv"

# Clean log for driver
CLEAN_LOG_PATH = "out/clean/clean-log-driver{}.csv".format(driver)

# Don't call again if log already cleaned
redo_file = os.path.isfile(CLEAN_LOG_PATH)

if not redo_file:
  try:
    subprocess.run(['bash', './src/formatCSV.sh' , LOG_PATH])
  except subprocess.CalledProcessError as err:
    print("Error while planning: " + err.stderr)

df = load_data(driver)

# TODO: https://discuss.streamlit.io/t/simple-button-that-waits-for-input/3322/2

if st.checkbox('Show raw data'):
    st.subheader('Raw data')
    st.write(df)

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

with st.spinner("Encoding data..."):
  corpus_lists = encode_data(df)

if st.checkbox('Show encoded data'):
    st.subheader('Encoded data')
    st.write(corpus_lists)

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

if st.checkbox('Plot Doc2Vec data'):
    st.subheader('Doc2Vec data')
    st.pyplot(visualize_data(X_d2v, 'D2V'))

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
  return pd.read_csv("out/centroids.csv", sep="\t")

# ------------------------------------------------------------------------------

with st.spinner("Clustering data..."):
  clusters = get_predictions(X_d2v)
  decoded_centroids = get_decoded_centroids_d2v()
  df_clusters = put_clusters_in_df(clusters, df)

# Show data
st.subheader('Cluster results')

st.pyplot(visualize_data(X_d2v, 'D2V', clusters))
st.write("Clustered data", df_clusters)

centroid_num = st.number_input('Select centroid to show', 1, 25)

centroid = decoded_centroids.loc[decoded_centroids['Cluster'] == centroid_num]

st.write("Centroids", centroid)

PREDICTION_PATH = "out/clustering/clustered-log-driver{}.csv".format(driver)

df_clusters.to_csv(PREDICTION_PATH, index=False)