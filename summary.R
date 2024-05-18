library("tidyverse")

# Store dataframes

team_summary_wl <- read.csv("Team Summaries.csv")
team_total_stats <- read.csv("Team Totals.csv")

# Team with the most wins overall

most_wins <- team_summary_wl %>%
  group_by(team) %>%
  summarise(total_wins = sum(w, na.rm = TRUE)) %>%
  filter(total_wins == max(total_wins))

# Team with he most wins in one season

most_dominant_season <- team_summary_wl %>%
  filter(w == max(w))

# Team with the most points scored overall

most_points <- team_total_stats %>%
  group_by(team) %>%
  filter(team != "League Average") %>%
  summarise(total_points = sum(pts, na.rm = TRUE)) %>%
  filter(total_points == max(total_points))
  
# Team with the most points scored in a season

most_points_season <- team_total_stats %>%
  filter(team != "League Average") %>%
  filter(pts == max(pts, na.rm = TRUE))

# Season with most personal fouls

highest_pf <- team_total_stats %>%
  filter(team != "League Average") %>%
  filter(pf == max(pf, na.rm = TRUE))





