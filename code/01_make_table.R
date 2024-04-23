#! TO DO:
#!   add call to here::i_am
here::i_am("code/01_make_table.R")

data <- readRDS(
  file = here::here("clean_code/data.rds")
)

library("labelled")
library("table1")

#Name the variables for the table
var_label(data) <- list(
  SurveyName = "Survey Name",
  RawScore = "Raw Score",
  Gender = "Gender",
  Race = "Patient Race",
  Ethnicity = "Patient Ethnicity",
  IndexAge = "Age at Index Date",
  CurrentAge = "Current Age",
  NumeGFR = "Number of eGFRs",
  Egfr.epi = "eGFR Score",
  Alcohol = "Alcohol Abuse",
  Cancer = "Cancer",
  Diabetes = "Diabetes",
  Obesity = "Obesity",
  SurveyGivenDateTime = "Date of Depression Survey"
)

#Create a table one of the demographics
table_one <- table1(~ RawScore + Gender + Race + Ethnicity + IndexAge + CurrentAge + NumeGFR + Egfr.epi + Alcohol + Cancer + Diabetes + Obesity | factor(SurveyName), data=data, caption = "Table 1: Descriptive Statistics of Demographic Data by Survey Type", render.missing = NULL)


saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)