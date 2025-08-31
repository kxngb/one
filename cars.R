install.packages("quantmod")
install.packages("forecast")
install.packages("ggplot2")
install.packages("xts")


library(quantmod)
library(forecast)
library(ggplot2)

install.packages("zoo")

library(zoo)
library(xts)

getSymbols("CUSR0000SETA02", src = "FRED")
head(CUSR0000SETA02)

car_prices <- ts(CUSR0000SETA02, start = c(1977,1), frequency = 12)

car_ts <- ts(as.numeric(CUSR0000SETA02),start = c(1977,1), frequency = 12)

plot(car_ts)

fit <- auto.arima(car_ts)
forecast_values <- forecast(fit, h = 24)
autoplot(forecast_values)

accuracy(fit)

forecast_values <- forecast(fit, h = 48)
autoplot(forecast_values)

end(CUSR0000SETA02)
end(car_ts)

forecast_values <-forecast(auto.arima(car_ts), h = 24)
autoplot(forecast_values)

autoplot(forecast_values, series="Forecast") +
  autolayer(car_ts, series="Historical") +
  xlab("Year") + ylab("CPI") +
  ggtitle("Used Car Prices: Historical + Forecast") +
  theme_minimal()
