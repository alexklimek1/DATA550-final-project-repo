#! TO DO:
#!   add call to here::i_am
library(here)
here::i_am("code/00_make_dataset.R")

library("tibble")

# Set seed for reproducibility
set.seed(42)

# Generate example data
n_patients <- 1000
patients <- data.frame(
  PatientICN = rep(1:n_patients, each = 7),
  SurveyName = rep(sample(c("PHQ9", "PHQ-2", "PHQ-2+I9"), n_patients, replace = TRUE), each = 7),
  RawScore = ifelse(rep(sample(c("PHQ9", "PHQ-2", "PHQ-2+I9"), n_patients, replace = TRUE), each = 7) == "PHQ9", 
                    sample(0:27, n_patients * 7, replace = TRUE),
                    sample(0:6, n_patients * 7, replace = TRUE)),
  CurrentAge = rep(sample(18:80, n_patients, replace = TRUE), each = 7),
  IndexAge = rep(sample(18:80, n_patients, replace = TRUE), each = 7),
  SurveyGivenDateTime = rep(seq(as.Date("2022-01-01"), by = "day", length.out = 7), n_patients),
  Gender = rep(sample(c("Male", "Female"), n_patients, replace = TRUE), each = 7),
  Race = rep(sample(c("White", "Black or African American", "Asian", 
                      "American Indian or Alaska Native", "Native Hawaiian or Other Pacific Islander", "Unknown"), 
                    n_patients, replace = TRUE), each = 7),
  Ethnicity = rep(sample(c("Hispanic or Latino", "Not Hispanic or Latino", "Unknown"), 
                         n_patients, replace = TRUE), each = 7),
  Alcohol = sample(0:1, n_patients * 7, replace = TRUE),
  Cancer = sample(0:1, n_patients * 7, replace = TRUE),
  Diabetes = sample(0:1, n_patients * 7, replace = TRUE),
  Obesity = sample(0:1, n_patients * 7, replace = TRUE),
  NumeGFR = rep(sample(1:10, n_patients, replace = TRUE), each = 7),
  Egfr.epi = sample(50:150, n_patients * 7, replace = TRUE)
)

# Convert to tibble for better printing
data <- as_tibble(patients)


#! TO DO: 
#!   save data in output directory

saveRDS(
  data, 
  file = here::here("output/data.rds")
)

