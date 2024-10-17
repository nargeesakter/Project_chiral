#load packages
library(tidyverse)
library(naniar)

#read data
data <- readxl::read_xlsx("C:/Users/Nargees PC/Downloads/Telegram Desktop/AMR_KAP_Data_coded.xlsx")


#check missing data
sum(is.na(data))
miss_var_summary(data)
gg_miss_var(data)
help("naniar")

#knowledge level grouping
data1 <- data %>% 
  mutate(Knowledge_Level = case_when(
    `PCT Knowledge` < 50 ~ "Poor",
    `PCT Knowledge` >= 50 & `PCT Knowledge`< 80 ~ "Moderate",
    `PCT Knowledge`>= 80 ~ "Good"
  ))

#attitude level grouping
data <- data %>% 
  mutate(Attitude_Level = case_when (
    `PCT Attitude` < 50 ~ "Negative",
    `PCT Attitude` >= 50 & `PCT Attitude` < 80 ~ "Uncertain",
    `PCT Attitude`>= 80 ~ "Positive"
  ))

#practice level grouping
data <- data %>% 
  mutate(Practice_Level = case_when (
    `PCT Practice` < 80 ~ "Misuse",
    `PCT Practice` >= 80 ~ "Good"
  ))

#export pre-processed data
#as csv
write.csv(data,"Data/AMR_KAP_Processed.csv", row.names = F)

# save as rds (for large file)
write_rds(data, "Data/AMR_KAP_Processed.rds")