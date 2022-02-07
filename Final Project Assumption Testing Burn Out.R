#Load libraries
library("mvnormtest")
library("car")

# All recoding already done in Python

#Subset data
keeps <- c("Mental_Fatigue_Score", "Burn_Rate")
WFH_Burnout1 <- WFH_Burn_Out_Cleaned[keeps]

#Limit rows
WFH_Burnout2 <- WFH_Burnout1[1:5000, ]

#Format as a matrix
WFH_BurnOut3 <- as.matrix(WFH_Burnout2)

#Test Assumptions - Sample size, must have at least 20 cases per independent variable, and must be more 
#cases then dependent variables in each cell. Assumption met with 22,750 entries.

#Test Assumptions - Multivariate Normality
mshapiro.test(t(WFH_BurnOut3))

#Normality Test P-value is <2.2e-16 and thus is signiicant, so the data does not meet the assumption for MANOVA's