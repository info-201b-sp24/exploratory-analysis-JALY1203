library("tidyverse")
library("knitr")

team_summary_wl <- read.csv("Team Summaries.csv")
team_total_stats <- read.csv("Team Totals.csv")

# make tables

team_summary_filtered <- team_summary_wl %>%
  select(season, team, w, l) %>%
  filter(season == "1999" | season == "2023")

team_total_filtered <- team_total_stats %>%
  select(season, team, x3pa, pf) %>%
  filter(season == "1999" | season == "2023")

# combine tables

full_table <- full_join(team_summary_filtered, team_total_filtered) %>%
  filter(team != "League Average") %>%
  rename(
    "Season" = season,
    "Team" = team,
    "Wins" = w,
    "Losses" = l,
    "3 Point Attempts" = x3pa,
    "Personal Fouls" = pf
  ) %>%
  arrange(Team)

kable(full_table)