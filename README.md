
---

## 📦 YINC E-Commerce Case Study - ETL Pipeline & PostgreSQL Data Warehouse

This project implements a complete **ETL (Extract, Transform, Load)** pipeline for an e-commerce dataset. It extracts raw CSV data, cleans and transforms it using **Pandas**, models it into relational tables, and loads it into a **PostgreSQL** database under a dedicated schema (`yinc`).

The pipeline is modular, reproducible, and structured to reflect real-world data engineering workflows.

---

## 🚀 Project Overview

This case study demonstrates:

* Data extraction from raw CSV files
* Data cleaning and transformation using Pandas
* Creation of relational tables
* Automated table creation in PostgreSQL
* Loading cleaned data into relational tables
* Environment-variable-based DB connection handling
* A fully reproducible ETL workflow

---

## 🧱 Final Data Model

The final dataset is organized into **5 tables**:

* `customer`
* `product`
* `shipping`
* `order`
* `payment_method`

---

## 📁 Project Structure

```bash
yinc_ecommerce_case_study/
│
├── dataset/
│   ├── raw_data/
│   │   └── yinc_ecommerce.csv
│   └── cleaned_data/
│       ├── customer.csv
│       ├── product.csv
│       ├── shipping.csv
│       ├── order.csv
│       └── payment_method.csv
│
├── yinc_etl.ipynb
├── .gitignore
└── README.md
```

---

## 🧪 1. Extraction Layer

The raw dataset is loaded using Pandas:

```python
import pandas as pd

path = r'dataset\\raw_data\\yinc_ecommerce.csv'
yinc_df = pd.read_csv(path)
```

### 🔧 Column Standardization

```python
yinc_df.columns = (
    yinc_df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)
```

---

## 🧹 2. Data Cleaning & Transformation

### Key Steps

* Dropping rows missing critical identifiers
* Converting `order_date` to datetime
* Generating synthetic `email_address`
* Splitting dataset into normalized tables

### Example Transformation

```python
customer_df = yinc_df[['customer_id','customer_name', 'email', 'phone_number']] \
    .drop_duplicates().reset_index(drop=True)

del customer_df["email"]

customer_df['email_address'] = (
    customer_df['customer_name']
    .str.lower()
    .str.replace(" ","_")
    + '@' + customer_df['customer_id'] + '.com'
)
```

---

## 🗂️ 3. Table Creation (PostgreSQL)

### 🔌 Database Connection

```python
from dotenv import load_dotenv
import os
import psycopg2

def get_db_connection():
    load_dotenv()
    db_url = os.getenv("DB_URL")
    return psycopg2.connect(db_url)
```

### 🏗️ Schema & Tables

```sql
CREATE SCHEMA IF NOT EXISTS yinc;

CREATE TABLE IF NOT EXISTS yinc.customer (...);
CREATE TABLE IF NOT EXISTS yinc.product (...);
CREATE TABLE IF NOT EXISTS yinc.shipping (...);
CREATE TABLE IF NOT EXISTS yinc.order (...);
CREATE TABLE IF NOT EXISTS yinc.payment_method (...);
```

---

## 📥 4. Data Loading

```python
def load_data_from_csv(csv_path):
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute(
        "INSERT INTO yinc.customer (...) VALUES (%s, %s, %s, %s)",
        row
    )

    conn.commit()
    cursor.close()
    conn.close()
```

### 🔁 Tables Loaded

* `customer.csv`
* `product.csv`
* `shipping.csv`
* `order.csv`
* `payment_method.csv`

---

## 🔐 Environment Variables

```env
DB_URL=postgresql://username:password@localhost:5432/database
```

> ⚠️ Ensure `.env` is in `.gitignore`

---

## 🛠️ Requirements

```bash
pip install pandas numpy psycopg2 python-dotenv
```

---

## ▶️ Running the Pipeline

1. Place raw data in:

```
dataset/raw_data/
```

2. Run:

```
yinc_etl.ipynb
```

3. Output:

* Cleaned CSVs
* PostgreSQL tables
* Loaded data

---

## 📊 Final Output

```sql
yinc.customer
yinc.product
yinc.shipping
yinc.order
yinc.payment_method
```

---

## 🧑‍💻 Author

**Yomi Ismail**
Data Engineer & Product Operations Specialist

---
