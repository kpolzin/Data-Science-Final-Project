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

#Normality Test P-value is <2.2e-16 and thus is significant, so the data does not meet the assumption for MANOVA's. Will continue for learning purposes

# Test - Assumptions - Homogeneity of Variance for Mental_Fatigue_Score. 
leveneTest(Mental_Fatigue_Score ~ Gender, data = WFH_Burn_Out_Cleaned)
leveneTest(Mental_Fatigue_Score ~ WFH_Setup_Available, data = WFH_Burn_Out_Cleaned)

leveneTest(Burn_Rate ~ Gender, data = WFH_Burn_Out_Cleaned)
leveneTest(Burn_Rate~ WFH_Setup_Available, data = WFH_Burn_Out_Cleaned)

#Levene's Test for Gender is not significant, nor is the test for WFH_Setup_Available for the Mental_Fatigue_Score variable, meaning the assumption is met. The assumption is not met for the Burn_Rate variable

# Test Assumptions - Absence of Multicollinearity
cor.test(WFH_Burn_Out_Cleaned$Mental_Fatigue_Score, WFH_Burn_Out_Cleaned$Burn_Rate, method = "pearson", use = "complete.obs")

# Assumption met - absence of multicollinearity

#Analysis
MANOVA <- manova(cbind(Mental_Fatigue_Score, Burn_Rate) ~ Gender*WFH_Setup_Available, data = WFH_Burn_Out_Cleaned) 
summary(MANOVA)

#The results are significant, meaning there is a significant relationship between Gender and WFH Setup Available and Mental Fatigue Score and Burn Rate
