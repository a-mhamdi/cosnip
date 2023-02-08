from sklearn.pipeline import Pipeline

from sklearn.preprocessing import MinMaxScaler
from sklearn.neighbors import KNeighborsClassifier

knn_pipe = Pipeline([
    ('mms', MinMaxScaler()), 
    ('knn', KNeighborsClassifier())
    ])

params = {
        'knn__n_neighbors': [3, 5, 7],
        'knn__weights': ['uniform', 'distance'],
        'knn__algorithm': ['ball_tree', 'kd_tree'],
        'knn__p': [1, 2, 3, 4]
        }

from sklearn.model_selection import GridSearchCV
gs_knn = GridSearchCV(
        knn_pipe,
        param_grid=params,
        scoring='accuracy'
        )

from sklearn.datasets import make_blobs
X, y = make_blobs(n_samples=100, centers=2, n_features=3)

gs_knn.fit(X, y)

# Display best hyperparams
gs_knn.best_params_

# Print best model score
gs_knn.score(X, y)
