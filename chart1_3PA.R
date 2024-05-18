library("tidyverse")
library("knitr")

# read csv from file
team_total_stats <- read.csv("Team Totals.csv")

# 3 point total by season
x3pa_total <- team_total_stats %>%
  group_by(season) %>%
  summarise(x3pa = sum(x3pa, na.rm = TRUE))

# create graph
ggplot(x3pa_total, aes(x = season, y = x3pa)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "3 Point Attempts Per Season",
       x = "NBA Season",
       y = "Total 3 Point Attempts") +
  theme_minimal()

