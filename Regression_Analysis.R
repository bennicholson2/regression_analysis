library(tidyverse)
library(modeldata)

data <- advanced_regression_analysis_dataset

new_column_name <- c('TotalSales', 'Feature1', 'Feature2', 'Feature3', 'Category', 'Noise', 'Feature6')
colnames(data) <- new_column_name

data$TotalSales <- as.numeric(as.character(data$TotalSales))
data$Feature1 <- as.numeric(as.character(data$Feature1))
data$Feature2 <- as.numeric(as.character(data$Feature2))
data$Feature3 <- as.numeric(as.character(data$Feature3))
data$Noise <- as.numeric(as.character(data$Noise))
data$Feature6 <- as.numeric(as.character(data$Feature6))

#Now that the data has column names and the NA data is removed
#Perform a regression analysis
#First step is to open up Orange and look at Correlation (this can be done in R aswell)
#Then determine which explanatory variables can be removed
#Feature3 can be removed from the variables

#Lets create the model
#The p value of category B and category C is around 0.2 which makes these variables redundant
#Remove these from the model 
#You are left with Total Sales ~ 11.14215 + Feature1 * 1.50631 + Feature2 * -0.42793 + Feature6 * 0.73527 + Noise * 1.27664

#You can see from the summary that the p value is small and the f statistic is large which suggests a model that has signifigance

regression_model = lm(TotalSales ~ Feature1 + Feature2 + Feature6 + Noise, 
                      data = data)