# Universal-summary-function-for-EDA-in-R
R script provides a comprehensive summaries for each column of a dataframe


# Detailed Dataframe Summary in R

This R script provides a comprehensive way to generate detailed summaries for each column of a dataframe. It is designed to handle both categorical and numerical data by counting the occurrences of each category in categorical columns and computing basic statistical summaries for numerical columns. This tool is particularly useful for exploratory data analysis, providing a quick and thorough overview of each column's characteristics in a dataset.

## Features

- **Categorical Data Handling**: Counts occurrences of each category.
- **Numerical Data Handling**: Computes summary statistics such as mean, median, minimum, maximum, and quartiles.
- **Flexible**: Can be applied to any R dataframe.
- **Output**: Generates a detailed summary, which can be viewed in the R console or saved as a CSV file.

## Prerequisites

Before you can run this script, you'll need to have R installed on your system. Additionally, the script uses the following R packages:

- `dplyr`
- `purrr`

If you don't have these packages installed, you can install them using the following commands in your R console:

```r
install.packages("dplyr")
install.packages("purrr")
