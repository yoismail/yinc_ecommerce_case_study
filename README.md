# YINC E-Commerce Case Study — ETL Pipeline & PostgreSQL Data Warehouse

This project implements a complete ETL (Extract, Transform, Load) pipeline for an e-commerce dataset, transforming raw CSV data into a structured PostgreSQL data warehouse. The pipeline extracts data, cleans and transforms it using Pandas, models it into relational tables (customer, product, shipping, order, payment_method), and loads it into a PostgreSQL database under the `yinc` schema. The workflow is designed to be modular, reproducible, and reflective of real-world data engineering practices.

**Key Features:**
- **Data Extraction:** Reads raw CSV data using Pandas.
- **Data Cleaning & Transformation:** Standardizes columns, handles missing values, converts data types, and generates synthetic data (e.g., `email_address`).
- **Relational Modeling:** Splits data into normalized tables: `customer`, `product`, `shipping`, `order`, `payment_method`.
- **PostgreSQL Integration:** Creates the `yinc` schema and tables, loads cleaned data, and manages database connections securely using environment variables (`.env` file).
- **Reproducibility:** Designed for easy setup and execution via a Jupyter notebook (`yinc_etl.ipynb`).

**Project Structure:**
<img width="231" height="349" alt="image" src="https://github.com/user-attachments/assets/71b3c357-e405-4aff-be77-72a6eac6f853" />
**Requirements:**
- Install dependencies: `pip install pandas numpy psycopg2 python-dotenv`
- Store database credentials in a `.env` file (e.g., `DB_URL=postgresql://username:password@localhost:5432/database`). Ensure `.env` is in `.gitignore`.

**Running the Pipeline:**
1. Place raw data in `dataset/raw_data/`.
2. Run `yinc_etl.ipynb`. The pipeline will generate cleaned CSVs, create PostgreSQL tables, and load the data.

**Engineering Decisions:**
- **PostgreSQL:** Chosen for strong relational modeling support, reliability for analytics, and common usage in data stacks. (Trade-off: Not optimized for distributed scale like BigQuery/Snowflake).
- **3-Layer Pipeline (Raw, Processed, Analytics):** Enhances traceability, debugging, and prevents source data corruption.
- **Pandas:** Efficient for medium-sized datasets and rapid ETL logic development. (Trade-off: Not suitable for large-scale distributed workloads; Spark/dbt preferred in production).
- **Modular Design:** Improves maintainability, enables safe reruns, and supports stage-based testing.
- **Environment Variables:** Secures credentials and supports environment-based configurations.
- **Dimensional Modeling:** Optimizes for analytics queries, reduces redundancy, and improves clarity.

**Key Takeaway:** This project prioritizes clarity, reproducibility, and structured engineering.

**Author:** Yomi Ismail (Data Engineer & Product Operations Specialist)
