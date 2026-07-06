# Power BI – Banking Portfolio Dashboard

This folder contains the Power BI dashboard built on top of the SQL analysis performed on the banking portfolio dataset.

## 📄 File

- `Banking_Portfolio_Dashboard.pbix` — Power BI report file *(rename to match your actual file)*

## 🔗 Data Source

The dashboard connects to the same data analyzed in SQL (`banking_portfolio` database / query outputs from `Sqlqueires.sql`), covering:
- Customers
- Accounts
- Branches
- Credit Cards
- Card Payments
- Loans
- Transactions
- Complaints
- Fraud Flags

Data can be connected either by:
1. **Direct MySQL connection** (Power BI → Get Data → MySQL Database), or
2. **Importing exported query results** as CSV/tables.

## 📊 Dashboard Pages / Visuals

| Section | Visuals Included |
|---|---|
| **Customer Overview** | Gender split, state-wise distribution, customer segment (Premium/HNI/etc.), customer status |
| **Account Insights** | Total & average balance, account status (Active/Closed/Dormant), top 10 customers by balance, monthly account opening trend |
| **Branch Performance** | Branch-wise deposits, customer count, and average balance (map/bar visuals) |
| **Loan Risk Monitoring** | Loans with DPD > 30, loan status distribution, outstanding principal by loan type |
| **Credit Card Utilization** | Utilization % by card/customer, credit limit vs. available limit |
| **Complaints & Service** | Average resolution days by complaint type & status, complaint volume by channel |
| **Fraud Monitoring** | Fraud flag count, risk score distribution, investigation status |

## 🧮 DAX Measures (add/update as per your actual measures)

```dax
Total Deposits = SUM(account_datasetsave[Balance])

Active Accounts = 
CALCULATE(
    DISTINCTCOUNT(account_datasetsave[Customer_ID]),
    account_datasetsave[Account_Status] = "Active"
)

Credit Utilization % = 
DIVIDE(
    SUM(credit_datasetsave[Credit_Limit]) - SUM(credit_datasetsave[Available_Limit]),
    SUM(credit_datasetsave[Credit_Limit])
) * 100

Overdue Loans (30+ DPD) = 
CALCULATE(
    COUNT(loan_datasetsave[Loan_ID]),
    loan_datasetsave[Days_Past_Due] > 30
)
```

## 🖼️ Preview

*(Add dashboard screenshots here, e.g.)*
```
![Dashboard Overview](screenshots/dashboard_overview.png)
```

## ▶️ How to Use

1. Open `Banking_Portfolio_Dashboard.pbix` in Power BI Desktop.
2. Refresh the data connection (update MySQL credentials if using a live connection).
3. Use slicers (Branch, State, Customer Segment, Loan Status, etc.) to filter insights interactively.

## 💡 Business Insights Delivered

- Identify high-value branches and dormant accounts needing reactivation
- Flag customers/cards nearing full credit utilization (risk of default)
- Track loan delinquency early through DPD monitoring
- Monitor complaint resolution efficiency by channel and type
- Spot potential fraud hotspots by risk score and status

## 🔗 Related

See `SQL/README.md` for the underlying database schema and query logic that powers this dashboard.
