# Banking Portfolio Analytics (SQL + Power BI)

End-to-end data analytics project on a simulated retail banking portfolio — from raw data to SQL-driven insights to an interactive Power BI dashboard.

## 📌 Project Overview

This project analyzes a bank's customer, account, credit, loan, transaction, complaint, and fraud data to uncover business insights around customer behavior, portfolio health, credit risk, and service quality. Data was cleaned and queried using **MySQL**, and the results were visualized in **Power BI** to create a decision-ready dashboard for stakeholders.

## 🗂️ Datasets Used

| Dataset | Description |
|---|---|
| `customer_datasetsave` | Customer demographics, income, credit score, segment, status |
| `account_datasetsave` | Savings/FD accounts, balances, status, opening channel |
| `branches_datasetsave` | Branch details — location, region, tier, manager |
| `credit_datasetsave` | Credit card details — limit, utilization, status |
| `card_datasetsave` | Card bill payments — due, paid, late fees |
| `loan_datasetsave` | Loan details — amount, EMI, outstanding, DPD (days past due) |
| `transaction_sav` | Transaction-level data — merchant, amount, mode, status |
| `complaints_datasetsave` | Customer complaints — type, priority, resolution time |
| `fraud_datasetsave` | Fraud flags linked to transactions with risk scores |

## 🛠️ Tech Stack

- **MySQL** – Database design, data loading (`LOAD DATA INFILE`), and analytical SQL queries
- **Power BI** – Dashboard building, DAX measures, and data visualization

## 🔍 Key Analysis Performed (SQL)

- Gender-wise and state-wise customer distribution
- Total & average account balance across the bank
- Account status breakdown (Active / Closed / Dormant)
- Top 10 customers by account balance
- Month-on-month trend of new account openings
- Branch-wise total deposits and average balance
- Loans overdue by more than 30 days (Days Past Due analysis)
- Credit card utilization percentage per customer
- Average complaint resolution time by type and status

## 📊 Power BI Dashboard

The SQL query outputs were imported into Power BI to build interactive visuals covering:
- Customer demographics & segmentation
- Branch-wise deposit & balance performance
- Loan delinquency (DPD) tracking
- Credit card utilization trends
- Complaint resolution and turnaround time

*(Add screenshots or a link to the .pbix file here once available)*

## 📁 Repository Structure

```
├── Sqlqueires.sql          # Database schema, data load, and analysis queries
├── datasets/               # Raw CSV datasets
├── PowerBI/                # .pbix dashboard file (if included)
└── README.md
```

## 🚀 How to Reproduce

1. Import the CSV files into MySQL using the schema in `Sqlqueires.sql`.
2. Run the analytical queries to generate insights.
3. Load the query results (or connect directly to MySQL) in Power BI.
4. Build/refresh the dashboard visuals.

## 📈 Business Value

This project simulates how a bank can use SQL + Power BI together to monitor customer health, credit risk, and service quality — enabling faster, data-backed decisions for branch managers and leadership.

---
*Feel free to explore the queries and dashboard, and reach out for any questions.*
