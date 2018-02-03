##
#Machine Learning algorithm - Simple Linear regression
##------------------------------------------------------------------------------------
# The dataset contains a linear dependency in years of experience vs salary.
# This ML model predicts salaries for comming years.


#install.packages('caTools')
library(caTools)

#Importing the data set
# setwd("Salary_Experience_Data.csv")
dataset = read.csv('Salary_Experience_Data.csv')

# Splitting the dataset into the Training set and Test set
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split== FALSE) 


# Fitting Simple Linerar Regression to the Training set (training the algorithm)

regressor = lm(formula = Salary ~ YearsExperience, data = training_set)


# Predicting the Test set results
y_prediction = predict(regressor, newdata = test_set)


#install.packages('ggplot2')
library(ggplot2)

# plot of the training set
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y= training_set$Salary),
             colour = 'red')+
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue')+
  ggtitle('Salary vs Experience (Training set)')+
  xlab('Years of experience')+
  ylab('Salary')


# plot of the test set

ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y= test_set$Salary),
             colour = 'red')+
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
             colour = 'blue')+
  ggtitle('Salary vs Experience (Test set)')+
  xlab('Years of experience')+
  ylab('Salary')

#Blue line is the predicting line while red dots are data points from the dataset.


