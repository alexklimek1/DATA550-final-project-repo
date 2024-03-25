#! TO DO:
#!   add call to here::i_am
here::i_am("code/02_make_figure.R")

data <- readRDS(
  file = here::here("output/data.rds")
)

library("ggplot2")
library("ggpubr")

#alcohol abuse by survey type
plot1 <- ggplot(data, aes(SurveyName, fill = factor(Alcohol))) + geom_bar(position = 'dodge') + labs(x = "Survey Name", y = "Count", title = "Counts of Alcohol") + scale_fill_manual(values = c('0' = 'lightpink', '1' = 'lightgreen'), name = 'Alcohol', labels = c("No", "Yes")) + theme_minimal()

#cancer by survey type
plot2 <- ggplot(data, aes(SurveyName, fill = factor(Cancer))) + geom_bar(position = 'dodge') + labs(x = "Survey Name", y = "Count", title = "Counts of Cancer") + scale_fill_manual(values = c('0' = 'lightpink', '1' = 'lightgreen'), name = 'Cancer', labels = c("No", "Yes")) + theme_minimal()

#diabetes by survey type
plot3 <- ggplot(data, aes(SurveyName, fill = factor(Diabetes))) + geom_bar(position = 'dodge') + labs(x = "Survey Name", y = "Count", title = "Counts of Diabetes") + scale_fill_manual(values = c('0' = 'lightpink', '1' = 'lightgreen'), name = 'Diabetes', labels = c("No", "Yes")) + theme_minimal()

#obesity by survey type
plot4 <- ggplot(data, aes(SurveyName, fill = factor(Obesity))) + geom_bar(position = 'dodge') + labs(x = "Survey Name", y = "Count", title = "Counts of Obesity") + scale_fill_manual(values = c('0' = 'lightpink', '1' = 'lightgreen'), name = 'Obesity', labels = c("No", "Yes")) + theme_minimal()

combined_figure <- ggarrange(plot1, plot2, plot3, plot4, labels = c("A", "B", "C", "D"), ncol = 2, nrow = 2)
combined_figure

ggsave(
  here::here("output/figure.png"),
  device = "png"
)