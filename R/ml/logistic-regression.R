# Load IRIS dataset
data(iris)
summary(iris)

# Split the data into train/test sets
sample <- sample(c(TRUE,FALSE),
                 nrow(iris),
                 replace = TRUE,
                 prob = c(.8,.2))

ds_train <- iris[sample,]
ds_test  <- iris[-sample,]

# Load, build and fit a multiclass classifier
library(nnet)
logr = multinom(Species ~ .,
                   data = ds_train)

# Predict the output of the test set
predict(logr, ds_test[-5], "class") -> y_pred

# Convert to numeric types
"y_true <- as.numeric(ds_test$Species)
y_pred <- as.numeric(y_pred)"

# Confusion matrix
library(ConfusionTableR)
cm <- multi_class_cm(y_pred, ds_test$Species)

cm$confusion_matrix
