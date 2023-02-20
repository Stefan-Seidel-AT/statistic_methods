# Linear Discriminant Analysis
# https://www.r-bloggers.com/2021/05/linear-discriminant-analysis-in-r/

# Linear Discriminant Analysis (LDA) is a dimensionality reduction technique. LDA used for dimensionality reduction to reduce the number of dimensions (i.e. variables) in a dataset 
# while retaining as much information as possible
#
# Basically, it helps to find the linear combination of original variables that provide the best possible 
# separation between the groups. The basic purpose is to estimate the relationship between a single categorical dependent variable and a set 
# of quantitative independent variables.

# The major applications or examples are
# -Predicting success or failure of new products
# -Accepting or rejecting admission to an applicant.
# -Predicting credit risk category for a person
# -Classifying patients into different categories.

# required packages
required_packages <- c("klaR",
                       "psych",
                        "MASS",
#                        "ggord",
                        "devtools")

# check for package: if required: install
for (package in required_packages) {
  #print(package)
  if (!require(package)){
    install.packages(package)
    }
}

# Enable the r-universe repo
options(repos = c(
  fawda123 = 'https://fawda123.r-universe.dev',
  CRAN = 'https://cloud.r-project.org'))

# Install ggord
install.packages('ggord')

# Load Libraries
library(klaR)
library(psych)
library(MASS)
library(ggord)
library(devtools)

# get Data
data("iris")
str(iris)

# create a scatterplot for the first four numerical variables
pairs.panels(iris[1:4],
             gap = 0,
             bg = c("red", "green", "blue")[iris$Species],
             pch = 21)

# Now you can see in the plot, scatter diagram, histogram, 
# and correlation values.

# Now we want to create the best separation groups 
# based on these species.

# Data partition
# create a training dataset and test dataset for
# prediction and testing purposes (60%/40%)
set.seed(123)
ind <- sample(2, nrow(iris),
              replace = TRUE,
              prob = c(0.6, 0.4))
training <- iris[ind==1,]
testing <- iris[ind==2,]

# Linear discriminatn analysis
linear <- lda(Species~., training)
linear

# Based on the training dataset, 38% belongs to setosa group, 
# 31% belongs to versicolor groups and 30% belongs to virginica groups.

# he first discriminant function is a linear combination of the four variables.

# Percentage separations achieved by the first discriminant function 
# is 99.37% and second is 0.63%
attributes(linear)

# Histogram
# stacked histogram for discriminant function values
p <- predict(linear, training)
# for first linear discriminant
ldahist(data = p$x[,1], g = training$Species)
# no overlaps of histograms -> looks good

# for second linear discriminant
ldahist(data = p$x[,2], g = training$Species)
# complete overlaps of histograms -> looks bad

# Biplot
ggord(linear, training$Species, ylim = c(-10, 10)

# Biplot based on LD1  and LD2. Setosa separated very clearly and some overlap 
# observed between Versicolor and virginica.
# Based on arrows, Sepal width and sepal length explained more for setosa, 
# petal width and petal length explained more for versicolor and virginica.
      
            
# Partition plot

# It provides the classification of each and every combination in 
# the training dataset
partimat(Species~., data = training, method = "lda")

partimat(Species~., data = training, method = "qda")

to be completet !!



