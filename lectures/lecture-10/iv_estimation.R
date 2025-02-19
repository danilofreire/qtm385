# Program to create the regression boxes for Chapter 6 using NYC Debates data  Mullainathan et al 2010

# Clear any previous work
rm(list=ls(all=TRUE))

# Load required package
# install.packages("estimatr")
library(estimatr)

# Import data
df <- read.csv("mullainathan.csv")

# Rename variables
ASSIGNED <- df$watch
TREATED <- df$watchdps
Y <- df$ochange

# Box 6.3: Regression Estimate of the ITT_D
ittd_model <- lm_robust(TREATED ~ ASSIGNED)
summary(ittd_model)

ITT_D <- coef(ittd_model)[2]

# Box 6.4: Regression Estimate of the ITT
itt_model <- lm_robust(Y ~ ASSIGNED)
summary(itt_model)

ITT <- coef(itt_model)[2]

# Box 6.5: 2SLS Regression Estimate of CACE
# format is iv_robust(Y ~ D | Z)

cace <- iv_robust(Y ~ TREATED | ASSIGNED)
summary(cace)

ITT/ITT_D ## Check value
