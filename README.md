# Supply Chain Analysis

End-to-end analysis of DataCo supply chain data using SQL Server, Python (pandas) and Power BI.

## Dataset
Three tables: Customers, Products and Order_Items.
- 180,519 order items
- 65,752 orders
- 20,652 customers
- 118 products

## Workflow
1. **Exploration (SQL):** checked rows, data types, nulls and duplicated columns in each table.
2. **Cleaning (Python):** removed empty and repeated columns, fixed 3 shifted customer rows, converted mixed date formats, and removed duplicate rows.
3. **Normalization (SQL):** split the 3 cleaned tables into 10 tables (3NF) with primary and foreign keys.
4. **Business analysis (SQL):** answered business questions about sales, profit, products, customers, shipping and delivery.
5. **Dashboard (Power BI):** interactive dashboard built on the cleaned data.

## Key numbers (from the SQL analysis)
- Total sales: 36.78M
- Total profit: 3.97M
- Profit margin: 10.78%
- Average order value: 559.45

## Repository structure
- `SQL/` : exploration, normalization and business analysis scripts
- `data/` : cleaned CSV files (Order_Items is zipped because of its size)
- `notebooks_and_powerbi/` : Python cleaning notebook
- `powerbi/` : Power BI dashboard file
- `images/` : dashboard screenshots
- `database.zip` : SQL Server database backup
  
## Tools
SQL Server, Python, pandas, Jupyter, Power BI

## Author
Mostafa Mohamed Bilal
