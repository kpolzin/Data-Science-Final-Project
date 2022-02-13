#Load libraries
library("gmodels")

# Using Prefer_WFHR and ProductivityR (#1) as variables due to results from correlation heat map. Will also run Satisfaction and ApproachR (#2)
#Testing Assumptions - Expected Frequencies #1
CrossTable(WFH_Cleaned$ProductivityR, WFH_Cleaned$Prefer_WFHR, fisher=TRUE, chisq = TRUE, expected = TRUE, sresid = TRUE, format = "SPSS")

# This is significant, but R Studio noted that the size of the workspace should be increased. Most frequencies are greater than five, There are exactly 20% with a value less than five, meeting assumptions

# With a p-value of 4.090327e-45, this test is significant meaning that preferring to work from home affects productivity

#Testing Assumptions - Expected Frequencies #2
CrossTable(WFH_Cleaned$Tech_supportR, WFH_Cleaned$Satisfaction_with_approachR, fisher=TRUE, chisq = TRUE, expected = TRUE, sresid = TRUE, format = "SPSS")

# This is significant, but R Studio noted that the size of the workspace should be increased. The number of frequencies less than five is almost half of the cells. Thus, the assumption is not met.

#This test is significant with a p-score of 6.458785E-26, meaning that having tech support influences satisfaction with approach.

