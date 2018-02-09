.libPaths("P:/RLibrary2")
install.packages("tidyverse")
library(tidyverse)

fish_data <- read.csv("Gaeta_etal_CLC_data_1.csv")
fish_data
head(fish_data)

#making a new coloumn; telling the column to name catfish big if their length exceeds 200 and small if not
fish_data %>%
  mutate(length_cat = ifelse(length>300, "big", "small")) -> fish_data_cat
fish_data_cat

#remove rows that have catfish that are less than 1mm
fish_data %>%
  mutate(length_cat = ifelse(length>300, "big", "small")) %>%
  filter(scalelength>=1) -> fish_data_cat_mm
fish_data_cat_mm
nrow(fish_data_cat_mm)

fish_data_cat_mm %>%
  filter(annnumber == "EDGE") -> fish_data_edge

ggplot(data=fish_data_cat_mm, aes(x = length, y = scalelength)) +
  geom_point(aes(color=lakeid))+
  xlab("Body Length") +
  ylab("Scale Length") +
  theme_classic()