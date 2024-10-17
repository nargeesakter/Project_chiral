# Load packages 
library(tidyverse)
library(gtsummary)

library(officer)
library(likert)

# Descriptive tables 
# Load data into R 
ds <- readxl::read_excel("C:/Users/Nargees PC/Downloads/Telegram Desktop/AMR_KAP_Data.xlsx")


# Table 1: Demographic characteristics 
ds|>
  select(1:11) |>
  tbl_summary(missing = "no", 
              type = everything() ~ "categorical") |>
  as_gt() |>
  gtsave("Tables/table1.docx")



# Table 2: Knowledge  
ds|>
  select(`Parent’s sex`, 12:23) |>
  tbl_summary(missing = "no",
              by =`Parent’s sex`, 
              type = everything() ~ "categorical")|>
  add_p() |>
  as_gt() |>
  gtsave("Tables/table2.docx")


# Table 3: Attitude  
ds |>
  select(24:33) |>
  tbl_summary(missing = "no", 
              type = everything() ~ "categorical") %>% 
  as_gt() |>
  gtsave("Tables/table3.docx")



# Table 4: Practices   
ds |>
  select(34:39) |> 
  tbl_summary(missing = "no", 
              type = everything() ~ "categorical") |>
  as_gt() |>
  gtsave("Tables/table4.docx")


# Table 5: Sources of information    
 ds |>
  select(41:49) |>
  tbl_summary(missing = "no") |>
   as_gt() |>
   gtsave("Tables/table5.docx")
 

# Table 6: Reasons for self-medication   
 ds|>
  select(51:62) |> 
  mutate(Others = `Others...62`) |>
  tbl_summary(missing = "no")|>
   as_gt() |>
   gtsave("Tables/table6.docx")
1