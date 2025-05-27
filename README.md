
# E-commerce Data Warehouse

## 📌 Project Overview
This project is a data warehouse designed for an e-commerce platform. It supports business decision-making by enabling efficient querying and reporting on customer behavior, sales trends, campaign performance, and return analysis.
Here’s how you can enhance your project documentation by adding **Prerequisites** and **Steps to Start the Project**:

---

## ✅ Prerequisites

Before starting the project, ensure you have the following tools and configurations set up:

1. **SQL Server** (2016 or later recommended)

   * Installed and running locally or on a server
   * SQL Server Management Studio (SSMS) for query execution
2. **SQL Server Integration Services (SSIS)**

   * Installed via Visual Studio (with Data Tools)
3. **Power BI Desktop**

   * For dashboard development and reporting
4. **Project Files**

   * `load_source_data.sql`: Script to populate OLTP database
   * `create_DWH.sql`: Script to create Data Warehouse schema
   * SSIS project for ETL
5. **Basic Knowledge**

   * SQL, Data Warehousing concepts, and ETL processes


## 🚀 Steps to Start the Project

Follow these steps to set up and run the e-commerce data warehouse:

### 1. **Set Up the OLTP Database**

* Open `source_oltp_data.sql` in SQL Server Management Studio (SSMS).
* Execute the script to create and populate the OLTP source database.

### 2. **Create the Data Warehouse Schema**

* Open `create_dwh_schema.sql` in SSMS.
* Execute the script to create fact and dimension tables in your data warehouse database (e.g., `DWH_Ecommerce`).

### 3. **Configure SSIS Project**

* Open the SSIS solution in Visual Studio.
* Update **connection managers** to point to:

  * Your OLTP database (source)
  * Your DWH database (destination)
* Review and test data flow tasks to ensure mappings and transformations are accurate.

### 4. **Run ETL Process**

* In Visual Studio, right-click the SSIS package and run it to perform the initial ETL load.
* Confirm data is populated correctly in the data warehouse.


## 💡 Business Processes Modeled
1. **Sales Transactions**: Tracks customer purchases including product details, quantities, discounts, and revenue.
2. **Campaign Performance**: Measures the impact of marketing campaigns on customer purchases.
3. **Product Returns**: Monitors returned products, reasons, refund amounts, and return timing.

## 📦 Fact Tables and Grain

### 1. Sales Fact Table
- **Grain**: One record per product per customer per order line on a specific date.
- **Type**: Transaction fact table.
- **Measures**: Net Revenue (Fully Additive)

### 2. Campaign Performance Fact Table
- **Grain**: One record per customer, campaign, subcategory, and date.
- **Type**: Periodic snapshot fact table.
- **Measures**: Total quantity, total sales, net sales (Fully Additive)

### 3. Returns Fact Table
- **Grain**: One record per return transaction.
- **Type**: Transaction fact table.
- **Measures**: Quantity Returned, Processing Days (Fully Additive)

## 🧩 Dimensions

| Dimension       | Type                                        |
|----------------|---------------------------------------------|
| D_Date          | Role-Playing Dimension                      |
| D_Customer      | Slowly Changing Dimension (SCD), Conformed  |
| D_PaymentMethod | Static Dimension                            |
| D_Supplier      | Slowly Changing Dimension (SCD)             |
| D_Product       | Slowly Changing Dimension (SCD), Conformed  |
| D_Return        | Junk Dimension                              |

## 🗄️ Source System
- **OLTP Source**: [OLTP-Ecommerce-Data](https://www.kaggle.com/datasets/sharangkulkarni/oltp-ecommerce-data)

## 🔁 ETL Process
- **Control Flow & Data Flow**: Implemented using SSIS.
- **Batch Process**: Scheduled to update warehouse periodically.

## 📊 Queries and Reporting
- **Queries**: Built for analyzing sales trends, campaign success, and return patterns.
- **Visualization**: Dashboards created using Power BI.

## 📈 Tools & Technologies Used
- SQL Server
- Power BI
- SSIS 

