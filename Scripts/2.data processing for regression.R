#Creating Knowledge Attitude Practice Level columns (by numeric codes)
# load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)

#read data
data <- readxl::read_xlsx("C:/Users/Nargees PC/Downloads/Telegram Desktop/AMR_KAP_Data_coded.xlsx")
#knowledge level grouping
data <- data %>% 
  mutate(Knowledge_Level = case_when (
    `PCT Knowledge`< 50 ~ 0,
    `PCT Knowledge`>= 50 & `PCT Knowledge`< 80 ~ 1,
    `PCT Knowledge`>= 80 ~ 2
  ))

#attitude level grouping
data <- data %>% 
  mutate(Attitude_Level = case_when (
    `PCT Attitude` < 50 ~ 0,
    `PCT Attitude` >= 50 & `PCT Attitude` < 80 ~ 1,
    `PCT Attitude`>= 80 ~ 2
  ))

#practice level grouping
data <- data %>% 
  mutate(Practice_Level = case_when (
    `PCT Practice` < 80 ~ 0,
    `PCT Practice`>= 80 ~ 1
  ))


# save as rds (for large file)
write_rds(data, "data/AMR_KAP_Processed_1.rds")

#import data
data <- readRDS("data/AMR_KAP_Processed_1.rds")