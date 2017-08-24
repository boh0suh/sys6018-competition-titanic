
library(readr)
library(rpart)

train <- read_csv('train.csv')
test <- read_csv('test.csv')


test$Survived <- rep(0,418)  # add in "Survived" column


firsttree <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,  # run a decision tree
             data=train,
             method="class")

Prediction <- predict(firsttree, test, type = "class")  # make prediction for test data

finalversion <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)

write.csv(finalversion, file = "finalversion.csv", row.names = FALSE)
