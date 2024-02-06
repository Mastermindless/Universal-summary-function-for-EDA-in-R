# Universal summary function for EDA in R
# I like to call annotations Y0 and quantitative data X0 and Z0 for additional row information.

Y0 <- read.csv("your_csv_file_with_col_contain_patient_data_as_rows.csv")
head(Y0)
summary(Y0)

library(dplyr)
library(purrr)

# Function to summarize a single column
summarize_column <- function(column, name) {
  if (is.factor(column) || is.character(column)) {
    # For categorical columns, count each level
    summary_df <- as.data.frame(table(column))
    colnames(summary_df) <- c("Category", "Count")
  } else if (is.numeric(column)) {
    # For numeric columns, calculate summary statistics
    summary_stats <- summary(column)
    summary_df <- data.frame(Statistic = names(summary_stats), Value = as.vector(summary_stats), stringsAsFactors = FALSE)
  } else {
    # For other types, return a simple summary
    summary_vec <- summary(column)
    summary_df <- data.frame(Summary = names(summary_vec), Value = as.vector(summary_vec), stringsAsFactors = FALSE)
  }
  
  # Add a column for the source column name
  summary_df$SourceColumn <- name
  
  return(summary_df)
}

# Function to apply summarize_column to each column in the dataframe
summarize_dataframe <- function(df) {
  summaries <- map_df(names(df), ~summarize_column(df[[.x]], .x), .id = "Variable")
  return(summaries)
}

# Applying the function to your dataframe Y0
detailed_summary <- summarize_dataframe(Y0)

# Viewing the detailed summary
print(detailed_summary)

# Optionally, write the summary to a CSV file
write.csv(detailed_summary, "detailed_summary_with_source_column.csv", row.names = FALSE)
