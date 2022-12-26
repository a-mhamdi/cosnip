using CSV, DataFrames

df = CSV.read("./dataset/Churn_Modelling.csv", DataFrame)
describe(df) # dropmissing!(df)

first(df, 5)
names(df)

ydf = select(df, :Exited)
y = ydf.Exited

Xdf = select(df, Not([:RowNumber, :CustomerId, :Surname, :Exited]))
names(Xdf)
first(Xdf, 5)

countries = sort(unique(reduce(vcat, Xdf.Geography)))
gender = sort(unique(reduce(vcat, Xdf.Gender)))

using OneHotArrays

b = onehotbatch(X[:, 2], countries)
c = onehotbatch(X[:, 3], gender)

n, m = size(Xdf)
X = Array{Any, 2}(undef, (n, m));

for i ∈ 1:m
    X[:, i] = Xdf[!, i];
end

using Flux

clf = Chain(
    Dense( m => 12, relu),
    Dense( 12 => 16, relu),
    Dense( 8 => 1, σ)
            )

data = Flux.DataLoader((X', y'), batchsize=16, shuffle=true)
optim = Flux.setup(Flux.Adam(.01), clf)