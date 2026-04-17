📦 **YINC E-Commerce Case Study** — ETL Pipeline & PostgreSQL Data Warehouse

This project implements a complete ETL pipeline for an e-commerce dataset, transforming raw CSV data into a structured PostgreSQL data warehouse. The pipeline extracts, cleans, transforms, models, and loads data into a PostgreSQL database (`yinc` schema), designed for modularity and reproducibility.

🚀 **Project Overview:**
- Data extraction from CSV.
- Cleaning & transformation with Pandas.
- Relational table creation.
- Automated PostgreSQL table creation & data loading.
- Secure DB connection handling via environment variables.

📊 **Final Data Model:**
- `customer`, `product`, `shipping`, `order`, `payment_method` tables.

📁 **Project Structure:**
<img width="231" height="349" alt="image" src="https://github.com/user-attachments/assets/71b3c357-e405-4aff-be77-72a6eac6f853" />

🛠️ **Requirements:**
- Install: `pip install pandas numpy psycopg2 python-dotenv`
- `.env` file for `DB_URL` (e.g., `postgresql://user:pass@host:port/db`).

▶️ **Running the Pipeline:**
1. Place raw data in `dataset/raw_data/`.
2. Run `yinc_etl.ipynb`.

⚙️ **Engineering Decisions:**
- **PostgreSQL:** For relational modeling & analytics.
- **3-Layer Pipeline:** For traceability & debugging.
- **Pandas:** For efficient data manipulation.
- **Modular Design:** For maintainability & safe reruns.
- **Environment Variables:** For secure credential management.
- **Dimensional Modeling:** For optimized analytics queries.

💡 **Key Takeaway:** Clarity, reproducibility, and structured engineering.

🧑‍💻 **Author:** Yomi Ismail
