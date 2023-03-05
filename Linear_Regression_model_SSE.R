# Linear Regression 
#
# tutorial from 
# https://www.tutorialspoint.com/r/r_linear_regression.htm#

# general mathematical equation for linear regression (linReg)
# is "y = ax + b"
# ->y is the response variable
# ->x is the predictor variable
#  -> a and b are constants which are called coefficients
#
# Steps to Establish a Regression
# example: predicting weight of person when height is known
# 1) gather information (measure) sample values where height and 
#         corresponding weight is known
# 2) create a relationship model using lm() functions in R
# 3) find the coefficients from the model created and create a 
#         mathematical equation using these
# 4) get a summary of the relation sphip model to know the average error in 
#         the predictions. also called residuals.
# 5) to predict the weight of new persons, use the predict() function in R


# Input Data

# Values of height
#151, 174, 138, 186, 128, 136, 179, 163, 152, 131
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)

# Values of weight.
#63, 81, 56, 91, 47, 57, 76, 72, 62, 48
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Apply the lm() function.
relation <- lm(y~x)

# print relation
print(relation)

# print summary of relation
print(summary(relation))

# predicting
# syntax: predict(object, new data)
# -> object: is the formula we already created using lm() function
# -> newdata: is the vector containing the new value for predictor variable

# predict weight of new persons
# The predictor vector.
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)

# The response vector.
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Apply the lm() function.
relation <- lm(y~x)

# Find weight of a person with height 170.
a <- data.frame(x = 170)
result <-  predict(relation,a)
print(result)

# visualize the regression Graphically:
# Create the predictor and response variable.
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
relation <- lm(y~x)

# Give the chart file a name.
png(file = "linearregression.png")

# Plot the chart.
plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,
     xlab = "Weight in Kg",ylab = "Height in cm")
# lines for predicted value
lines(y,x, abline(h=170, ,col="red", lty = 5))  # lty = 5 .... long-dashed line
lines(y,x, abline(v=76.22869 ,col="red", lty = 5)) #v-value from prediction


# Save the file.
dev.off()

