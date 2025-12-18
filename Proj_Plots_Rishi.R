# Load Libraries
library(tidyquant) #Loads the financial data
library(tidyverse) # Data Manipulation
library(scales) # Useful in formatting
library(lubridate) # Allows us to work with dates easily

# AAPL    = Apple Inc.
# HNHPF   = Hon Hai Precision (Foxconn) - OTC US listing
# TSM     = Taiwan Semiconductor - NYSE ADR
# 4938.TW = Pegatron Corp - Taiwan Stock Exchange
# 2324.TW = Compal Electronics - Taiwan Stock Exchange

tickers <- c("AAPL", "HNHPF", "TSM", "4938.TW", "2324.TW")

# Start from Jan 1, 2022
start_date <- "2022-01-01"
end_date   <- Sys.Date()

stock_data <- tq_get(tickers, #Get the daily stock price data from Yahoo Finance.
                     get  = "stock.prices", 
                     from = start_date, 
                     to   = end_date)

# Prepare Cumulative Growth chart
yearly_growth <- stock_data %>% # Using the stock data from above.
  mutate(year = year(date)) %>% # mUtates the data, new column called year
  group_by(symbol, year) %>%
  mutate(
    # Reset growth to 0% at start of every year
    pct_change = (adjusted / first(adjusted)) - 1
  ) %>%
  ungroup()

# B. Total Annual Return for the Bar Chart
annual_summary <- stock_data %>%
  mutate(year = year(date)) %>%
  group_by(symbol, year) %>%
  summarize(
    total_return = (last(adjusted) - first(adjusted)) / first(adjusted),
    .groups = "drop"
  )

# Plot-1: Line Chart
line_plot <- ggplot(yearly_growth, aes(x = date, y = pct_change, color = symbol)) +
  geom_line(linewidth = 0.8) +
  facet_wrap(~ year, scales = "free", ncol = 2) +
  scale_y_continuous(labels = percent_format()) +
  theme_tq() +
  scale_color_tq() +
  labs(
    title = "Apple vs. Suppliers: Yearly Growth",
    subtitle = "Performance reset to 0% at the start of each year",
    y = "Cumulative Return",
    x = "",
    color = "Ticker"
  ) +
  theme(legend.position = "bottom")

print(line_plot) # This will result in the line plot for every year.

# Plot-2: Bar Chart
bar_plot <- ggplot(annual_summary, aes(x = symbol, y = total_return, fill = symbol)) +
  geom_col(color = "black", alpha = 0.8) +
  facet_wrap(~ year, ncol = 2) +
  geom_text(aes(label = percent(total_return, accuracy = 1)), 
            vjust = -0.5, size = 3, fontface = "bold") +
  scale_y_continuous(labels = percent_format(), expand = expansion(mult = c(0.1, 0.2))) +
  scale_fill_tq() +
  theme_tq() +
  labs(
    title = "Total Return for Each Year",
    y = "Total % Change",
    x = ""
  ) +
  theme(legend.position = "none")

print(bar_plot) # This will result in the bar plot for every year.