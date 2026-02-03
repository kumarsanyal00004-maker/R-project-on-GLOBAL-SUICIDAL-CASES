#GENDER COMPARISON
ggplot(suicide_data, aes(x=year, y=suicides_per_100k, color=sex)) +
  geom_line(stat="summary", fun="mean") +
  labs(title="Suicide Rate by Gender Over Time",
       x="Year", y="Suicides per 100k")


#AGE GROUP ANALYSIS
ggplot(suicide_data, aes(x=age, y=suicides_per_100k, fill=age)) +
  geom_boxplot() +
  labs(title="Suicide Rates by Age Group",
       x="Age Group", y="Suicides per 100k")

