.libPaths("P:/RLibrary2")
install.packages("tidyverse")
library(tidyverse)

fish_data <- read.csv("Gaeta_etal_CLC_data.csv")
fish_data
head(fish_data)

#making a new coloumn; telling the column to name catfish big if their length exceeds 200 and small if not
fish_data %>%
  mutate(length_cat = ifelse(length>200, "big", "small")) -> fish_data_cat
fish_data_cat
