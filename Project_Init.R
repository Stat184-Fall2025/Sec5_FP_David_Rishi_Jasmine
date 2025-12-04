install.packages("tidyquant")
library(tidyquant)
tickers <- c("AAPL")
tickers1 <- c("HNHPF")
start_date <- "2022-01-01"
end_date   <- Sys.Date() # Today


appl_data <- tq_get(tickers, 
                     get  = "stock.prices", 
                     from = start_date, 
                     to   = end_date)

foxconn_data <- tq_get(tickers1, 
                    get  = "stock.prices", 
                    from = start_date, 
                    to   = end_date)
