install.packages("tidyquant")
#if not installed yet


library(dplyr)
library(tidyquant)
tickers <- c("AAPL","HNHPF")
start_date <- "2022-01-01"
end_date   <- Sys.Date() # Today


stock_data <- tq_get(tickers, 
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


