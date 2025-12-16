install.packages("tidyquant")
#if not installed yet


library(dplyr)
library(tidyquant)
library(ggplot2)

# Add tickers for Apple, Foxconn, TSMC, Pegatron, and Compal
tickers <- c("AAPL","HNHPF", "TSM", "4938.TW", "2324.TW")

tickers_small <- c("AAPL", "HNHPF")

start_date <- "2022-01-01"
end_date   <- Sys.Date() # Today

# Get stock data
stock_data <- tq_get(tickers, 
                     get  = "stock.prices", 
                     from = start_date, 
                     to   = end_date)

stock_data_small <- tq_get(tickers_small, 
                           
                     get  = "stock.prices", 
                     from = start_date, 
                     to   = end_date)

"I normalized the data b/c APPL stock price is over 100 and HNHPF is less than 10, 
so we wont be able to see the couple cent changes in foxconn and comparison to the dollar changes in APPL.
In other words HNHPF will look like a flat line even when APPL in visually moving up and down."


normalized_data <- stock_data %>%
  select(symbol, date, adjusted) %>%
  group_by(symbol) %>%
  arrange(date) %>%
  mutate(
    percent_change = ((adjusted / first(adjusted) - 1)*100)
         ) 

normalized_data_small <- stock_data_small %>%
  select(symbol, date, adjusted) %>%
  group_by(symbol) %>%
  arrange(date) %>%
  mutate(
    percent_change = ((adjusted / first(adjusted) - 1)*100)
  ) 

# Line chart
ggplot(normalized_data, aes(x = date, y = percent_change, color = symbol)) + 
  geom_line(linewidth = .5) +
  labs(title = "Normalized Stock Performance",
       x = "Date",
       y = "Percent Change",
       color = "Stock") + 
  theme_minimal()


ggplot(normalized_data_small, aes(x = date, y = percent_change, color = symbol)) + 
  geom_line(linewidth = .5) +
  labs(title = "Normalized Stock Performance",
       x = "Date",
       y = "Percent Change",
       color = "Stock") + 
  theme_minimal()
