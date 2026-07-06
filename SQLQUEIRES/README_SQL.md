# SQL – Banking Portfolio Analytics

This folder contains the database schema, data loading script, and analytical SQL queries used to derive insights from the bank's portfolio data.

## 📄 File

- `Sqlqueires.sql` — Full script: database creation, table schemas, data import, and analysis queries.

## 🗄️ Database

**Database Name:** `banking_portfolio`
**Engine:** MySQL 8.0

### Tables Created

| Table | Purpose |
|---|---|
| `customer_datasetsave` | Customer demographics & profile |
| `account_datasetsave` | Account-level balance & status data |
| `branches_datasetsave` | Branch master data |
| `credit_datasetsave` | Credit card master data |
| `card_datasetsave` | Card billing & payment history |
| `loan_datasetsave` | Loan details & repayment status |
| `transaction_sav` | Transaction-level records |
| `complaints_datasetsave` | Customer complaint logs |
| `fraud_datasetsave` | Fraud flags linked to transactions |

## 📥 Data Loading

Data was imported using `LOAD DATA INFILE`, with `local_infile` enabled on the MySQL server:

```sql
SET GLOBAL local_infile = 1;

LOAD DATA INFILE "path/to/transaction_sav.csv"
INTO TABLE transaction_sav
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
```

> Note: Update the file path to match your local MySQL `Uploads` directory, and ensure `secure_file_priv` allows access to that folder.

## 🔍 Analysis Queries Included

1. **Customer Demographics**
   - Total male vs. female customers
   - Customer count by state (e.g., Uttar Pradesh, West Bengal, Gujarat)

2. **Account Portfolio Health**
   - Total and average account balance
   - Account status split — Active / Closed / Dormant
   - Top 10 customers by balance
   - Month-wise trend of new accounts opened

3. **Branch Performance**
   - Branch-wise customer count, total deposits, and average balance

4. **Loan Risk**
   - Loans with Days Past Due (DPD) greater than 30, sorted by severity

5. **Credit Card Utilization**
   - Utilized amount and utilization % per card, ranked highest to lowest

6. **Complaint Resolution**
   - Average resolution time grouped by complaint type and status

## ▶️ How to Run

1. Create the database and tables by running the schema section of `Sqlqueires.sql`.
2. Load each CSV file into its corresponding table.
3. Execute the analysis queries individually to view results, or export them for use in Power BI.

## 🔗 Next Step

Query outputs from this folder feed directly into the **Power BI** dashboard — see the `PowerBI/README.md` for details.
