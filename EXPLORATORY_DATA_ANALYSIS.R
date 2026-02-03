#Summary Statistics
suicide_data %>%
  summarise(mean_rate = mean(suicides_per_100k),
            median_rate = median(suicides_per_100k),
            sd_rate = sd(suicides_per_100k))


#Global Trend Visualization
library(ggplot2)

ggplot(suicide_data, aes(x=year, y=suicides_per_100k)) +
  geom_line(stat="summary", fun="mean", color="blue", size=1.2) +
  labs(title="Global Suicide Rate Over Time",
       x="Year", y="Suicides per 100k")
