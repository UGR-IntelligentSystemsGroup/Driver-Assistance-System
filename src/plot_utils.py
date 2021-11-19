# plot-utils.py
# Visualization functions

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Visualization
from sklearn.decomposition import PCA
from sklearn.manifold import TSNE

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

def color_tagged_df(val):
    colors = {
        "none": "#f2564fff",
        "No": "#f2564fff",
        "Yes": "green",

        "ndd": "#3071e8ff", # light-steel-blue
        "edd": "#ff2e00",

        "first": "#faa549ff",
        "second": "#f2564fff",
        "third": "#b7d0f1ff",
        "unique": "#E09F3E",

        "split_1": "#963d72ff",
        "split_2": "#537a34ff",
        "uninterrupted": "#57acdc",
    }

    color = "default" if not val in colors.keys() else colors[val]

    return 'color: %s' % color