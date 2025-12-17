# Annual Return Table
annual_return_table <- annual_summary %>%
  mutate(
    total_return_pct = scales::percent(total_return, accuracy = 0.1)
  ) %>%
  select(symbol, year, total_return_pct) %>%  # Keep only the formatted column
  arrange(year, symbol)

# Create a styled table
kbl(
  annual_return_table,
  caption = "Annual Total Returns for Apple and Suppliers",
  col.names = c("Symbol", "Year", "Total Return (%)"),
  align = c("c","c","c"),
) %>%
  kable_styling() %>%
  column_spec(1, bold = TRUE)   # Bolds the ticker column