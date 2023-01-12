using CSV, DataFrames
using MLJ

df = CSV.read("./datasets/Churn_Modelling.csv", DataFrame)
schema(df) # dropmissing!(df)

first(df, 5)
names(df)

ydf = select(df, :Exited)
y = ydf.Exited

Xdf = select(df, Not([:RowNumber, :CustomerId, :Surname, :Exited]))

names(Xdf)
first(Xdf, 5)

n, m = size(Xdf)
X = Array{Any, 2}(undef, (n, m));

for i in 1:m
    X[:, i] = Xdf[!, i];
end

countries = sort(unique(reduce(vcat, Xdf.Geography)))
gender = sort(unique(reduce(vcat, Xdf.Gender)))

using OneHotArrays

b = onehotbatch(X[:, 2], countries)
c = onehotbatch(X[:, 3], gender)

using Flux

clf = Chain(
    Dense( m  => 12, relu ),
    Dense( 12 => 16, relu ),
    Dense( 8  => 1, σ )
            )

X = permutedims(X)
y = permutedims(y)

data = Flux.DataLoader((X, y), batchsize=16, shuffle=true)
optim_state = Flux.setup(Flux.Adam(.01), clf)


losses = []

using ProgressMeter
@showprogress for epoch in 1:1_000
    for (x, y) in data 
        loss, grad = Flux.withgradient(clf) do mdl
            ŷ = mdl(X);
            Flux.crossentropy(ŷ, y);
        end
        Flux.update!(optim_state, clf, grads[1])
        push!(losses, loss)
    end
    sleep(.01)
end
