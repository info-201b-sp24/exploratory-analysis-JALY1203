library("tidyverse")
library("knitr")

# load csv
team_summary_wl <- read.csv("Team Summaries.csv")

# wins for 1980 - 1999
wins_1980_1999 <- team_summary_wl %>%
  filter(season >= 1980 & season <= 2000) %>%
  group_by(team) %>%
  summarise(w = sum(w)) %>%
  mutate(Period = "1980-1999") %>%
  filter(w == max(w))

# wins for 2000 - 2019
wins_2000_2019 <- team_summary_wl %>%
  filter(season >= 2000 & season <= 2019) %>%
  group_by(team) %>%
  summarise(w = sum(w)) %>%
  mutate(Period = "2000-2019") %>%
  filter(w == max(w))

# combine to one dataframe
combined_wins <- bind_rows(wins_1980_1999, wins_2000_2019)

# create bar graph
ggplot(combined_wins, aes(x = reorder(team, -w), y = w, fill = Period)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7)) +
  labs(title = "Highest Win Count Teams in 1980-1999 vs 2000-2019",
       x = "Team",
       y = "Total Wins") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))