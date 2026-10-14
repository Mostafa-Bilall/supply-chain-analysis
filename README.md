# DataCo Supply Chain Analysis

End-to-end analysis of DataCo supply chain data using SQL Server, Python (pandas) and Power BI: from raw CSV files to a cleaned, normalized database and an interactive dashboard.

![Dashboard](images/dashboard.png)

## Dataset

Three source tables: Customers, Products and Order_Items.

- 180,519 order items
- 65,752 orders
- 20,652 customers
- 118 products, 51 categories, 11 departments

## Workflow

1. **Exploration (SQL):** checked row counts, data types, nulls, distinct values and duplicated columns in each table.
2. **Cleaning (Python, pandas):**
   - removed empty and unneeded columns (e-mail, password, latitude, longitude, product image, description, status, order zipcode)
   - removed 4 duplicated columns in Order_Items
   - fixed 3 customer rows whose values were shifted into the wrong columns
   - merged first and last name into one full-name column
   - converted order and shipping dates, which came in two formats (text and Excel numbers), to real date-time values
   - removed repeated rows (Customers: 180,519 to 20,652 rows, Products: 180,519 to 118 rows)
   - validated that Sales = Price x Quantity, Item Total = Sales - Discount, and that customer and product IDs match across tables
3. **Normalization (SQL Server, 3NF):** split the 3 cleaned tables into 10 tables with primary and foreign keys:
   - Customers side: States, Zipcodes, Customers
   - Products side: Departments, Categories, Products
   - Orders side: Regions, Delivery_Statuses, Orders, Order_Items
4. **Business analysis (SQL):** answered business questions about sales, profit, products, customers, payment types, shipping and delivery.
5. **Dashboard (Power BI):** interactive dashboard built on the cleaned data.

## Key numbers (from the SQL analysis)

| KPI | Value |
|---|---|
| Total sales | 36.78M |
| Net sales (after discount) | 33.05M |
| Total discount | 3.73M (10.14% of sales) |
| Total profit | 3.97M |
| Profit margin | 10.78% |
| Average order value | 559.45 |

## Selected findings

- **Market:** Europe has the highest sales (about 10.87M), and Western Europe is the top region.
- **Customers:** the Consumer segment generates the highest sales and profit, while Corporate gets the highest average discount.
- **Losses:** 33,784 order items lost money, with a total loss of about 3.88M.
- **Delivery:** 37,698 orders were shipped in more days than scheduled, but only 36,048 are labeled "Late delivery". The remaining 1,650 are labeled "Shipping canceled".
- **Order status:** orders with the status SUSPECTED_FRAUD and CANCELED both have a "Shipping canceled" delivery status.

All numbers come from the queries in `SQL/SQLQuery_Business_Analysis_AQ.sql` and `SQL/SQLQuery_Anylsis_After_Cleaning.sql`.

## Repository structure

- `SQL/` : exploration, normalization and business analysis scripts
- `data/` : cleaned CSV files (Order_Items is zipped because of its size)
- `notebooks_and_powerbi/` : Python cleaning notebook
- `powerbi/` : Power BI dashboard file
- `images/` : dashboard screenshots
- `database.zip` : SQL Server database backup

## How to reproduce

1. Run the Python notebook to clean the raw files. It reads the CSV files from the same folder as the notebook.
2. Import the cleaned CSV files into SQL Server, or restore the database backup from `database.zip`.
3. Run the SQL scripts in order (01, 02, 03, then the analysis scripts).
4. Open the Power BI file from the `powerbi/` folder.

## Tools

SQL Server, Python, pandas, NumPy, Jupyter Notebook, Power BI

## Author

Mostafa Mohamed Bilal
