library(fable)
library(tsibble)
library(dplyr)

# Step 1: Filter and clean Ireland data
ireland <- suicide_data %>%
  filter(country == "Ireland") %>%
  select(year, suicides_per_100k) %>%
  group_by(year) %>%
  summarise(suicides_per_100k = mean(suicides_per_100k, na.rm = TRUE)) %>%
  arrange(year)

# Step 2: Convert to tsibble
ireland_ts <- ireland %>%
  as_tsibble(index = year)

# Step 3: Fit ARIMA model
model <- ireland_ts %>%
  model(ARIMA(suicides_per_100k))

# Step 4: Forecast next 10 years
forecast_values <- model %>%
  forecast(h = 10)

# Step 5: Plot the forecast
autoplot(forecast_values, ireland_ts) +
  labs(title = "Forecasted Suicide Rates in Ireland",
       y = "Suicides per 100k")
