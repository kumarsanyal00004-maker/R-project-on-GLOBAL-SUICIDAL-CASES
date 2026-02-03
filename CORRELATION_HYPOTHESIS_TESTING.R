# GDP vs SUICIDE RATE 

library(ggplot2)
library(dplyr)

# Rename the column to remove special characters
suicide_data <- suicide_data %>%
  rename(gdp_per_capita = `gdp_per_capita ($)`)

# Create the plot
ggplot(suicide_data, aes(x = gdp_per_capita, y = suicides_per_100k)) +
  geom_point(alpha = 0.6, color = "darkblue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "GDP vs Suicide Rate",
       x = "GDP per Capita", y = "Suicides per 100k")



# CORRELATION TEST 

cor.test(suicide_data$gdp_per_capita, suicide_data$suicides_per_100k)
