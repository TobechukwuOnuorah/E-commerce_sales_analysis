## E-commerce_sales_analysis
This project provides a full analysis pipeline of an e-commerce dataset using MySQL. It includes data cleaning, transformation, KPI calculations, and generation of business insights using SQL queries

###  Dataset Overview

- **Database:** `online_sales`
- **Primary Table:** `ecommerce_sales_cleaned`
- **Cloned Table for Processing:** `ecommerce_sales`
  
### Tools 
- Excel - Data Cleaning 
- MySQL - Data Cleaning and Data Analysis
- Power Bi - Visualization

###  Data Cleaning & Preparation

1. **Cloned the original dataset** to preserve raw data.
2. **Duplicate Detection** using `ROW_NUMBER()` and CTEs.
3. **Data Standardization**:
   - Standardized categorical fields and verified data consistency.
   - Ensured proper date formats and fixed data types for `order_date` and `ship_date`.
4. **Spell Check & Standardization**:
   - Reviewed distinct values in fields like region,category,sub_category.
5. **Null & Blank Space Checks**:
   - Performed checks to identify missing or incomplete values in important columns.

### 🗂️ Project Structure

1. **KPI Calculation**
   - Total revenue
   - Total quantity sold
   - Number of categories and sub-categories
   - Customer count and distribution

2. **Insights Extracted**
   - Sales by region
   - Top-performing product categories and sub-categories
   - Yearly and monthly sales trends
   - Immediate delivery patterns
   - Shipping method performance
   - Average quantity per order
  
### 📊 Exploratory Data Analysis (EDA)

#### 1. **Revenue & Quantity Insights**
- Total revenue generated across all transactions.
- Total quantity of products sold.

#### 2. **Regional Performance**
- Identified regions with the highest sales volume.
- Analyzed customer distribution per region.

#### 3. **Category & Sub-category Analysis**
- Top-performing product categories and sub-categories.
- Highest selling sub-categories by units and revenue.

#### 4. **Time-Based Trends**
- Total yearly revenue and quantity sold.
- Month-over-month sales and quantity trend.

#### 5. **Shipping Behavior**
- Most frequently used shipping modes.
- Products most often shipped the same day they were ordered.

#### 6. **Customer Metrics**
- Total and unique customer count.
- Average quantity of products per order.

### 🛠️ SQL Features Used
- `CTE` and `ROW_NUMBER()` for duplicate identification.
- `STR_TO_DATE()` and `DATE_FORMAT()` for date parsing and formatting.
- Aggregate functions: `SUM()`, `COUNT()`, `AVG()`, `ROUND()`.
- Filtering and grouping: `GROUP BY`, `ORDER BY`, `WHERE`.
- Conditional logic using `CASE WHEN` for temporal and categorical grouping.

### 📊 Power BI Dashboard

Below is a Power BI dashboard summarizing key business metrics and insights from the e-commerce dataset:

🔗 [View Power BI Dashboard](https://github.com/TobechukwuOnuorah/E-commerce_sales_analysis/blob/main/powerbi-dashboard/powerbi-dashboard.png)

🔗 [View Power BI Dashboard](https://github.com/TobechukwuOnuorah/E-commerce_sales_analysis/blob/main/powerbi-dashboard.png)


#### Key Highlights:
- Total Sales: $11.49M
- Quantity Sold: 38K
- Unique Customers: 793
- Top Categories: Technology, Furniture, Office Supplies
- Highest Selling Region: West ($3.6M)
- Most Sold Sub-Categories: Chairs, Phones, Tables
- Monthly Sales Trend: Clear growth trajectory with seasonal spikes
 
This dashboard provides a visual overview of revenue distribution, product performance, and customer behavior across different years and regions.

#### 📌 How to Use the Dashboard

- You can filter the data using slicers for shipping mode and state.
- Use year and region toggles to explore temporal and geographic performance.
- The dashboard was built using Power BI Desktop and linked directly to the cleaned SQL dataset.

---
### 📌 Note

This project is intended for educational and analytical purposes only. The dataset has been anonymized and used strictly for demonstrating SQL skills in a Product sales context.

---

### 📧 Contact

For questions or feedback, feel free to reach out via GitHub Issues or connect with me on [LinkedIn](https://www.linkedin.com/in/tobechukwu-onuorah-4a69ba2b0/)



