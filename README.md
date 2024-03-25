
# DATA550 Final Project Repository

This repository contains the code and files for the final project of DATA550. This particular data project focuses on analyzing the relationship between depression tests and PKD (Polycystic Kidney Disease) in a sample dataset.

## Generating the Final Report

To generate the final report, follow these steps:

1. Ensure you have R and RStudio installed on your system.
2. Clone this repository to your local machine.
3. Open RStudio and set the working directory to the root of the cloned repository.
4. Run the command `make final_report.html` in the terminal or console within RStudio.

The final report will be generated as `final_report.html` in the `code` folder.
To clean the output after generating the report, run the command `make clean` in the terminal. 

## Code Description / Content

### Variables
__Variable__ (*Type*) Description
- __PatientICN:__ (*Integer*) Unique sequence of numbers representing individual patient
- __SurveyName:__ (*Character*) Depression test, has to be either PHQ9, PHQ-2, or PHQ-2+I9
- __RawScore:__ (*Integer*) Score of depression survey taken (For a PHQ-2 and PHQ-2+I9 test must be between 0-6, for PHQ9 between 0-27)
- __CurrentAge:__ (*Integer*) Age of patient currently
- __IndexAge:__ (*Integer*) Age of patient when they took their first depression test
- __SurveyGivenDateTime:__ (*Date*) Date of when the depression test was taken 
- __Gender:__ (*Character*) Male or female
- __Race:__ (*Character*) Patient race (White, Black or African American, Asian, American Indian or Alaska Native, Native Hawaiian or Other Pacific Islander, Unknown)
- __Ethnicity:__ (*Character*) Patient ethnicity (Hispanic or Latino, Not Hispanic or Latino, Unknown)
- __Alcohol:__ (*Integer*) Alcohol abuse (1 if yes, 0 if no)
- __Cancer:__ (*Integer*) Cancer (1 if yes, 0 if no)
- __Diabetes:__ (*Integer*) Diabetes (1 if yes, 0 if no)
- __Obesity:__ (*Integer*) Obese (1 if yes, 0 if no)
- __NumeGFR:__ (*Integer*) Number of eGFR measurements in total the patient received
- __Egfr.epi:__ (*Integer*) eGFR score at a given time


`code/00_make_dataset.R`
- generates example data with 7,000 rows and 15 columns. The data is longitudinal with multiple observations per person. The columns created are described above. 
- saves data set as `data.rds` in `output/` folder

`code/01_make_table.R`
- reads data set saved by `code/00_make_dataset.R`
- creates labels for variables to present nicely in a table
- creates a table of the variables by survey name
- saves the table as `table_one.rds` in `output/` folder

`code/02_make_figure.R`
- reads data set saved by `code/00_make_dataset.R`
- uses ggplot to create four box plots of the counts of the four co-morbidities for the entire population
- creates one figure combining the four plots
- saves the figure as `figure.png` in `output/` folder

`code/final_report.Rmd`
- loads the output into a nice report with descriptions of what you should see in the table and figure

`code/04_render_report.R`
- renders the report, `code/final_report.Rmd` in production mode

