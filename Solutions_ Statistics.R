
###########################
# Module D2               #
# Graded exercises set 1  #
###########################


### Problem 1 ##########################################################

### load needed packages
library(ggplot2)
library(car)
library(mice)

### import data please have the dataset in the curent working directory
mydata <- morley


### restructure/format data as needed plus looking at data
str(mydata)                           # checking the structure of the data
mydata$Expt = as.factor(mydata$Expt)  # change Expt from int to factor  
str(mydata)                           # check if changes where worked
md.pattern(mydata)                    # checking for missing data -> NONE found

# data seems to be useful as it is now

### fit ANOVA model
lm = lm(Speed ~ Expt, data = mydata)  # create a linear model
myanova <- anova(lm)                  # create the ANOVA table
myanova                               # look at ANOVA table and get results
#Expt     4    --> F value = 4.2878
#Residual 95


### extract needed information (e.g. p-value)
summary(myanova)

# Given that p-value = 0.05 the 5 different experiments lead to significant 
# different means for the measured speeds. Since the p-value of the test is
# 0.003114 and therby the H0 has to be rejected!

# To visualize the data, I would use the boxplot for each group The R code for
# this visualization is given below:
ggplot(mydata, aes(Expt, Speed)) +
  geom_boxplot() + 
  stat_boxplot(geom = 'errorbar', width = 0.3)

### Problem 2 ##########################################################

mydata_pt = with(mydata, pairwise.t.test(Speed, Expt, "holm")) 
mydata_pt

# The holm adjusted p-values for 1 and 5 (0.0122) and 1 and 4 (0.0028) indicate 
# are smaller then the chosen p value of 0.05 and thereby differ significantly 
# from Experiment 1

### Problem 3 ##########################################################

#QQ-Plot
qqPlot(resid(lm))

#Normalitiy
shapiro.test(resid(lm))

# Because the found p (0.01501) < 0.05, we reject the null hypothesis of 
# normality and conclude that the residuals do not come from a normal 
# distribution.

# Here, the points in the right tail seem to systematically lie above the line. 
# This indicates that the right tail (high values) of the residual distribution 
# is a bit heavier than the right tail of a normal distribution Further the 
#  QQPlot shows that there are 4 values out of the 95% range.


### Problem 4 ##########################################################

bartlett.test(Speed ~ Expt, data = mydata)
# p-value = 0.02102

leveneTest(Speed ~ Expt, data = mydata)
# p-value = 0.1602

# The found p-values differ from each other in case of the Lavene Test the H0 
# would be correct. However, Bartlett test should be chosen since it is more 
# sensitive to non-normality and it was proven in Exercise 3 that there is a
# non normality present in the data. Since the found p-value < 0.05 the null 
# hypothesis of equal variances has to be rejected.


### Problem 5 ##########################################################

# Determination of p Value
kruskal.test(Speed ~ Expt, data = mydata)
# p = 0.0212

# Since the p (0.0212) < 0.05 the H0 is rejected. Which means that the five 
# Experiments tend to give different results.
