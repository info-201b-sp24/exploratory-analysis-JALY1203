library("tidyverse")
library("knitr")

# read csv from file
team_total_stats <- read.csv("Team Totals.csv")

# Personal Fouls Per Season
pf_total <- team_total_stats %>%
  group_by(season) %>%
  summarise(pf = sum(pf, na.rm = TRUE))

# create graph
ggplot(pf_total, aes(x = season, y = pf)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "Personal Fouls Per Season",
       x = "NBA Season",
       y = "Total Personal Fouls") +
  theme_minimal()