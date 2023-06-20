# Sets Classification Algorithm for Predicting if a congress person is democrat or republican

# Imports Library
library(caret)

# Reads CSV
votes <- read.csv("C:/Users/User/Documents/DataSets/84Vote.csv")

# Replaces NA values with very large negative number
# This is because the model used below doesn't allow for null values
votes <- replace(votes, is.na(votes), -12345)

# Creates Index
index <- createDataPartition(votes$class, p = 0.8, list = FALSE)

# Sets Training & Testing Datasets
votes.training <- votes[index,]
votes.testing <- votes[-index,]

# Trains Two Models
model_rf <- train(votes.training[, 1:15], votes.training[, 16], method='rf')
model_knn <- train(votes.training[, 1:15], votes.training[, 16], method='knn')

# Gets Predictions from both
predictions_rf<-predict.train(object=model_rf, votes.testing[,1:15])
predictions_knn<-predict.train(object=model_knn, votes.testing[,1:15])

# Views Confusion Value
confusionMatrix(predictions_rf, factor(votes.testing[, 16]))
confusionMatrix(predictions_knn, factor(votes.testing[, 16]))


