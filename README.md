# Apple Stock Price Analysis

This repository is for the final group project for STAT 184, wherein we analyze whether there is any relationship between Apple's stock price and the stock price of its suppliers. 
Currently in progress.

## Overview

The primary goal of this project is to investigate the "supply chain signal", in particular, the hypothesis that the stock performance of key manufacturing partners can predict movements in Apple's (AAPL) stock price. The main supplier companies that we are focusing on are TSMC, Foxconn, Pegatron and Compal, which are all key suppliers of Apple.
### Interesting Insight 
Our linear regression analysis revealed a distinct hierarchy in the supply chain. While one might expect all suppliers to move in sync with Apple, our models show that TSMC is the only supplier with a strong, statistically significant positive correlation with Apple.

In contrast, the assemblers (Pegatron and Compal) showed high volatility and no statistically significant predictive power. This suggests that the market values proprietary technology (chips) differently than commodity labor (assembly), and that TSMC effects Apple's performance much more closely than the other supply partners do.


<img width="512" height="345" alt="image" src="https://github.com/user-attachments/assets/fa16374d-bab6-48a5-a658-16f856b007ff" />

## Data Sources and Acknowledgements

Data Source: All financial data (daily stock prices, adjusted closing prices, and trading volume) was sourced from Yahoo Finance using the 'tidyquant' R package.

Acknowledgements:

This project relies heavily on the tidyverse ecosystem (dplyr, ggplot2) for data manipulation and visualization.

We also utilize broom for tidying our statistical regression outputs and knitr/kableExtra for generating professional tables in our reports.

## Current Plan

We are currently in the final stages of the project. Our remaining tasks includes:

Refining Visualizations: Ensuring all plots have accessible alt-text(Completed).

Regression Analysis: We have moved from a multivariate model to individual linear regressions to better isolate specific supplier effects on the stock price of Apple(Completed).

Final Report Generation: Knitting the final Quarto file into a submission-ready PDF.

Code Review: Cleaning the code appendix to ensure that it follows the Tidyverse style guide.


## Repo Structure

Final_Project.qmd: The core analysis file. This Quarto document contains all R code for fetching data, cleaning, visualization, and regression analysis, interwoven with our narrative findings.

Final_Project.pdf: The rendered final output of our analysis, ready for submission.

README.md: This file, providing an overview of the repository.

## Authors

David Goldberg - Data Manipulation &  Data Visualization. Please contact me at dpg5549@psu.edu

Jasmine Randhawa - Narrative Text &  Data Visualization. Please contact me at jhr5389@psu.edu

Rishi Lal - Narrative Text, Data Visualization and Data Analysis. Please contact me at rxl5565@psu.edu
