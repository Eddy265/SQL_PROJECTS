# Data Wrangling Project: Unicorn Companies Data

## Overview

This project focuses on the data wrangling process for a dataset containing information about unicorn companies. Unicorn companies are privately held startups with a valuation of over $1 billion. The dataset includes various attributes such as company details, valuation, investors, and financial stages.

The goal of this project is to clean and transform the raw dataset into a structured format suitable for analysis and reporting. The data wrangling process involves tasks like handling missing values, data type conversions, normalization, and creating relationships between tables.

## Contents

- `Raw_Data`: This directory contains the original raw data files in CSV format.

- `SQL_Script`: This directory includes SQL scripts used for data cleaning, transformation, normalization, and creating primary and foreign keys.

- `Processed_Data`: The cleaned and transformed data files are saved in this directory.

- `README.md`: The project documentation you're currently reading.

## Data Wrangling Steps

1. **Loading and Inspection**: The initial step involves loading the raw data files into Postgres and inspecting the structure and content of the dataset.

2. **Cleaning and Transformation**: Various cleaning and transformation tasks are performed using SQL scripts. Some key steps include:
    - Handling missing values by replacing them with appropriate values or NULL.
    - Converting data types to ensure consistency and accuracy.
    - Cleaning and standardizing columns like `Date_joined`, `Valuation`, and `Total_Raised`.

3. **Normalization**: After data cleaning, the data is normalized by creating separate tables for related information and establishing primary and foreign keys. This step reduces redundancy and improves data integrity, leading to a structured relational database.

4. **Analysis and Reporting**: With the cleaned and structured data, you can perform various analyses and generate reports to gain insights into unicorn companies' characteristics, valuation trends, and investor relationships.

## Acknowledgments

This project is part of a data wrangling and analysis exercise. The raw data used in this project is for educational purposes and was obtained from Kaggle.com.

