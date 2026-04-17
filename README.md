📦 YINC E‑Commerce Case Study — ETL Pipeline & PostgreSQL Data Warehouse

This project implements a complete ETL (Extract, Transform, Load) pipeline for an e‑commerce dataset. It extracts raw CSV data, cleans and transforms it using Pandas, models it into relational tables, and loads it into a PostgreSQL database under a dedicated schema (yinc).

The pipeline is modular, reproducible, and structured to reflect real‑world data engineering workflows.

🚀 Project Overview

This case study demonstrates:

Data extraction from raw CSV files

Data cleaning and transformation using Pandas

Creation of relational tables

Automated table creation in PostgreSQL

Loading cleaned data into relational tables

Environment‑variable‑based DB connection handling

A fully reproducible ETL workflow

The final dataset is organized into 5 tables:

customer

product

shipping

order

payment_method

📁 Project Structure

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

🧪 1. Extraction Layer

The raw dataset is loaded from:

path = r'dataset\raw_data\yinc_ecommerce.csv'
yinc_df = pd.read_csv(path)

Column names are standardized:

yinc_df.columns = (
    yinc_df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)

🧹 2. Data Cleaning & Transformation

Key cleaning steps include:

Dropping rows missing critical identifiers

Converting order_date to a proper datetime object

Generating a synthetic email_address field

Creating separate tables for each entity

Example:

customer_df = yinc_df[['customer_id','customer_name', 'email', 'phone_number']] \
    .drop_duplicates().reset_index(drop=True)

del customer_df["email"]

customer_df['email_address'] = (
    customer_df['customer_name'].str.lower().str.replace(" ","_")
    + '@' + customer_df['customer_id'] + '.com'
)

🗂️ 3. Table Creation (PostgreSQL)

A reusable DB connection function loads credentials from .env:

def get_db_url():
    load_dotenv()
    db_url = os.getenv("DB_URL")
    return psycopg2.connect(db_url)

Tables are created under the yinc schema:

CREATE SCHEMA IF NOT EXISTS yinc;

CREATE TABLE IF NOT EXISTS yinc.customer (...);
CREATE TABLE IF NOT EXISTS yinc.product (...);
CREATE TABLE IF NOT EXISTS yinc.shipping (...);
CREATE TABLE IF NOT EXISTS yinc.order (...);
CREATE TABLE IF NOT EXISTS yinc.payment_method (...);

📥 4. Loading Cleaned Data into PostgreSQL

Each cleaned CSV is loaded using a simple loader function:

def load_data_from_csv(csv_path):
    conn = get_db_url()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO yinc.customer (...) VALUES (%s, %s, %s, %s)", row)

This process is repeated for:

customer.csv

product.csv

shipping.csv

order.csv

payment_method.csv

🔐 Environment Variables

Database credentials are stored in a .env file:

DB_URL=postgresql://username:password@localhost:5432/database

.env is included in .gitignore to prevent exposing secrets.

🛠️ Requirements

Install dependencies:

pip install pandas numpy psycopg2 python-dotenv

▶️ Running the Pipeline

Place raw data in dataset/raw_data/

Run the ETL notebook (yinc_etl.ipynb)

Cleaned CSVs will be generated automatically

PostgreSQL tables will be created

Data will be loaded into the database

📊 Final Output

A fully populated PostgreSQL schema:

yinc.customer
yinc.product
yinc.shipping
yinc.order
yinc.payment_method

Ready for analytics, BI dashboards, or further modeling.

🧑‍💻 Author

Yomi Data Engineer & Product Operations Specialist Focused on building clean, reproducible, analytics‑ready data systems.

If you'd like, I can also generate a data model diagram, badges, or a Docker setup for this project.
