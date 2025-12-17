## Create assignment 06 data

# Set seed
set.seed(42)

# Load necessary library
library(readr)
library(dplyr)
library(attritevis)

# Read the CSV file
data <- read.csv("~/Documents/github/qtm385/lectures/lecture-11/test_data.csv")

# Get the number of rows in the original dataset
n_original_rows <- nrow(data)

# Determine sample size - at least 2000, or more if original dataset is larger
sample_size <- max(2000, n_original_rows)

# Take a sample with replacement to ensure at least 2000 observations
sampled_data <- sample_n(data, sample_size, replace = TRUE)

# Select and rename variables, keeping the specified order
processed_data <- sampled_data %>%
  select(
    age,
    sex,
    education,
    state,
    income,
    religion,
    attrition_2,
    cards_a,
    cards1,
    treat1,
    Happy_1_1,
    Happy_1_3
  ) %>%
  rename(
    treatment = treat1,
    mood = Happy_1_1,
    outcome1 = cards1,
    outcome2 = Happy_1_3
  )

# Keep the desired order of columns
processed_data <- processed_data[, c("age", "sex", "education", "state", "income", "religion", "attrition_2", "cards_a", "treatment", "mood", "outcome1", "outcome2")]

# Display the first few rows of the processed data to verify
head(processed_data)

# Check the number of rows to confirm it's at least 2000
nrow(processed_data)

# Save the processed data to a new CSV file named "survey.csv"
write.csv(processed_data, "attrition_data.csv", row.names = FALSE)

balance_attrite(data = processed_data, 
        treatment = "treatment", 
        question = "outcome2")

plot_attrition(processed_data,
              treatment_q = "treatment",
              outcome_q = c("outcome"),
              freq = FALSE,
              mycolors = c(treatment = "#000066",
                           control = "#CC0033")
              )


bounds(processed_data,
       treatment = "treatment",
       DV = "outcome1", type="Lee")
