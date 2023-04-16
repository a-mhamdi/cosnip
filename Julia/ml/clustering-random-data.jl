using MLJ
X, _ = make_blobs(1_000, 7; centers=5, cluster_std=[1., 1., 1., 1., 1.], as_table=false)

using Clustering
# cluster X into 5 clusters using K-means
R = kmeans(X', 5; maxiter=200, display=:iter)

@assert nclusters(R) == 5 # verify the number of clusters

a = assignments(R) # get the assignments of points to clusters
c = counts(R) # get the cluster sizes
M = R.centers # get the cluster centers

PCA = @load PCA pkg=MultivariateStats
pca_ = PCA(maxoutdim=3)

pca = machine(pca_, table(X)) |> fit!
Xproj = transform(pca, table(X))
Mproj = transform(pca, table(M'))

using Plots
scatter3d(Xproj.x1, Xproj.x2, Xproj.x3, color=:summer, marker_z=a, legend=false)
scatter3d!(Mproj.x1, Mproj.x2, Mproj.x3, color=:black, legend=false)

