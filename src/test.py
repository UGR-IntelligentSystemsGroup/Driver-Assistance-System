# Requirements:
# gensim
# streamlit
# pandas
# numpy
# sklearn

#########################################################################

import numpy as np
import pandas as pd
import streamlit as st
import matplotlib.pyplot as plt

from joblib import load

import subprocess

# Preprocessing
# from sklearn.preprocessing import OrdinalEncoder
from sklearn.preprocessing import normalize

# BOW-TFIDF
# from gensim.corpora.dictionary import Dictionary
# from gensim.models.tfidfmodel import TfidfModel
# from gensim.matutils import corpus2dense, corpus2csc

# D2V
from gensim.models.doc2vec import Doc2Vec

# Clustering
# from sklearn.cluster import KMeans

# Visualization
from sklearn.decomposition import PCA
from sklearn.manifold import TSNE

#########################################################################
# Visualize embeddings
#########################################################################

def plot_tsne(matrix, clusters=None, ax=None):
  ax = ax or plt.gca()

  # TSNE
  tsne = TSNE(n_components=2, random_state=12345)
  X_tsne = tsne.fit_transform(matrix)
  df_tsne = pd.DataFrame(X_tsne, columns=['x', 'y'])

  ax.scatter(df_tsne['x'], df_tsne['y'], alpha=0.8, c=clusters, edgecolors='b', cmap="gist_rainbow")
  ax.set_title('TSNE')

# -------------------------------------------------------------------------

def plot_pca(matrix, clusters=None, ax=None):
  ax = ax or plt.gca()

  # PCA
  pca = PCA(n_components=2)
  X_pca = pca.fit_transform(matrix)
  df_pca = pd.DataFrame(X_pca, columns=['x', 'y'])

  ax.scatter(df_pca['x'], df_pca['y'], alpha=0.8, c=clusters, edgecolors='b', cmap="gist_rainbow")
  ax.set_title('2D PCA')
  
# -------------------------------------------------------------------------

def plot_3d_pca(matrix, clusters=None, ax=None):
  ax = ax or plt.gca()

  # PCA
  pca = PCA(n_components=3)
  X_pca = pca.fit_transform(matrix)
  df_pca = pd.DataFrame(X_pca, columns=['x', 'y', 'z'])

  ax.scatter3D(df_pca['x'], df_pca['y'], df_pca['z'], alpha=0.8, c=clusters, edgecolors='b', cmap="gist_rainbow")
  ax.set_title('3D PCA')

# -------------------------------------------------------------------------

# Call the three functions above in a horizontal view
def visualize_data(matrix, model_name, clusters=None, ax1=None, ax2=None):
  fig = plt.figure(figsize=(27,6))
  fig.suptitle('{} document plots'.format(model_name))

  ax1 = fig.add_subplot(131)
  ax2 = fig.add_subplot(132)
  ax3 = fig.add_subplot(133, projection='3d')

  plot_tsne(matrix, ax=ax1, clusters=clusters)
  plot_pca(matrix, ax=ax2, clusters=clusters)
  plot_3d_pca(matrix, ax=ax3, clusters=clusters)

  return fig

#########################################################################

st.title('Driver activity recognition')

#########################################################################
# Load data
#########################################################################


@st.cache
def load_data(DATA_PATH):
    df = pd.read_csv("out/clean-log.csv", sep="\t")

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

# DATA_PATH = "./out/logs-recognition/combined-log.csv"

# Get driver to predict
driver = st.number_input('Select driver log', 1, 288)

DATA_PATH = "./out/logs-recognition/log-driver{}.csv".format(driver)

# Clean log for driver
subprocess.run(['bash', './src/formatCSV.sh' , DATA_PATH])

data_load_state = st.text('Loading data...')
df = load_data(DATA_PATH)
data_load_state.text("Loading: Done!")

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

data_load_state = st.text('Encoding data...')
corpus_lists = encode_data(df)
data_load_state.text("Encoding: Done!")

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

# data_load_state = st.text('Getting BOW...')
# X_bow = get_bow(corpus_lists)
# st.pyplot(visualize_data(X_bow, 'BOW'))
# data_load_state.text("BOW: Done!")

data_load_state = st.text('Getting D2V...')
X_d2v = get_d2v(corpus_lists)
X_d2v = normalize(X_d2v)
data_load_state.text("D2V: Done!")

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
  # centroids = kmeans.cluster_centers_

  # Get metrics
  # silhouette = silhouette_score(X, clusters)
  # ch = calinski_harabasz_score(X, clusters)
  # db = davies_bouldin_score(X, clusters)

  return clusters

# ------------------------------------------------------------------------------

def get_decoded_centroids_d2v():
  return pd.read_csv("out/centroids.csv", sep="\t")

# ------------------------------------------------------------------------------

def put_clusters_in_df(clusters, df):
  # Final dataset columns
  cols = df.columns.to_numpy()
  cols = np.append(cols, 'Cluster')

  df_out = pd.DataFrame(columns=cols)

  groups = df.groupby(['Driver','Day'], sort=False)

  # Add clusters to log
  for (name, group), cluster in zip(groups, clusters):
    group["Cluster"] = cluster
    df_out = df_out.append(group)

  return df_out

# ------------------------------------------------------------------------------

data_load_state = st.text('Clustering data...')

clusters = get_predictions(X_d2v)
decoded_centroids = get_decoded_centroids_d2v()
df_clusters = put_clusters_in_df(clusters, df)

data_load_state.text("Clustering data: Done!")

# Show data
st.subheader('Cluster results')

st.pyplot(visualize_data(X_d2v, 'D2V', clusters))
st.write("Clustered data", df_clusters)

centroid_num = st.number_input('Select centroid to show', 1, 25)

centroid = decoded_centroids.loc[decoded_centroids['Cluster'] == centroid_num]

st.write("Centroids", centroid)