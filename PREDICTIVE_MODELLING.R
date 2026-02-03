# REGRESSION MODEL
model <- lm(suicides_per_100k ~ gdp_per_capita + sex + age, data=suicide_data)
summary(model)

# CLUSTERING COUNTRIES 
library(cluster)
library(ggplot2)
library(dplyr)

country_data <- suicide_data %>%
  group_by(country) %>%
  summarise(mean_rate = mean(suicides_per_100k, na.rm = TRUE))

clusters <- kmeans(country_data$mean_rate, centers = 3)
country_data$cluster <- as.factor(clusters$cluster)

print(country_data)

ggplot(country_data, aes(x = country, y = mean_rate, fill = cluster)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Country Clusters by Suicide Rate",
       x = "Country", y = "Mean Suicide Rate")

