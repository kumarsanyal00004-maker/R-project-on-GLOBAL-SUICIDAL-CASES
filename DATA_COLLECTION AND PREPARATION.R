#LOADING CSV
# Load base libraries
library(readr)
library(dplyr)

# Load the dataset
suicide_data <- read_csv("/home/ksg/Downloads/suicide_dataset.csv")

# Peek at the structure
glimpse(suicide_data)



#CLEAN AND PREPARATION
library(tidyr)

suicide_data <- suicide_data %>%
  distinct() %>%
  drop_na() %>%
  mutate(suicides_per_100k = suicides_no / population * 100000)

