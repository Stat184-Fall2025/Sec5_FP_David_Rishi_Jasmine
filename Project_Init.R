install.packages("tidyquant")
library(tidyquant)
tickers <- c("AAPL", "TSM", "QCOM", "SWKS", "AVGO", "TXN")
start_date <- "2022-01-01"
end_date   <- Sys.Date() # Today


stock_data <- tq_get(tickers, 
                     get  = "stock.prices", 
                     from = start_date, 
                     to   = end_date)
