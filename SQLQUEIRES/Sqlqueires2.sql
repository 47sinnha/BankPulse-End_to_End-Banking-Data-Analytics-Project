CREATE DATABASE banking_portfolio;
USE banking_portfolio;

CREATE TABLE customer_datasetsave (
    Customer_ID VARCHAR(20),
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(20),
    Age INT,
    City VARCHAR(50),
    State VARCHAR(50),
    Occupation VARCHAR(50),
    Monthly_Income DECIMAL(12,2),
    Marital_Status VARCHAR(30),
    Education VARCHAR(50),
    Credit_Score INT,
    Customer_Since DATE,
    Branch_ID VARCHAR(20),
    Customer_Segment VARCHAR(30),
    Customer_Status VARCHAR(30)
);


CREATE TABLE account_datasetsave (
    Account_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Account_Type VARCHAR(50),
    Open_Date DATE,
    Balance DECIMAL(15,2),
    Account_Status VARCHAR(30),
    Branch_ID VARCHAR(20),
    Opening_Channel VARCHAR(30)
);


CREATE TABLE branches_datasetsave (
    Branch_ID VARCHAR(20),
    Branch_Name VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Region VARCHAR(30),
    Tier VARCHAR(30),
    Branch_Type VARCHAR(30),
    Branch_Manager VARCHAR(100)
);

CREATE TABLE credit_datasetsave (
    Card_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Card_Type VARCHAR(50),
    Credit_Limit DECIMAL(15,2),
    Available_Limit DECIMAL(15,2),
    Annual_Fee DECIMAL(10,2),
    Interest_Rate DECIMAL(5,2),
    Card_Status VARCHAR(30),
    Issue_Date DATE,
    Expiry_Date DATE,
    Reward_Type VARCHAR(50)
);

CREATE TABLE card_datasetsave (
    Payment_ID VARCHAR(20),
    Card_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Billing_Month VARCHAR(10),
    Bill_Amount DECIMAL(15,2),
    Minimum_Due DECIMAL(15,2),
    Amount_Paid DECIMAL(15,2),
    Payment_Date DATE,
    Payment_Status VARCHAR(30),
    Late_Fee DECIMAL(10,2)
);

CREATE TABLE loan_datasetsave (
    Loan_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Loan_Type VARCHAR(50),
    Loan_Amount DECIMAL(15,2),
    Interest_Rate DECIMAL(5,2),
    Tenure_Months INT,
    Disbursement_Date DATE,
    EMI DECIMAL(15,2),
    Outstanding_Principal DECIMAL(15,2),
    Days_Past_Due INT,
    Loan_Status VARCHAR(30),
    Branch_ID VARCHAR(20)
);

CREATE TABLE transaction_sav (
    Transaction_ID VARCHAR(20),
    Card_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Transaction_Date DATE,
    Merchant VARCHAR(100),
    Merchant_Category VARCHAR(50),
    Amount DECIMAL(15,2),
    Payment_Mode VARCHAR(50),
    Transaction_Status VARCHAR(30),
    City VARCHAR(50),
    Device VARCHAR(50)
);

CREATE TABLE complaints_datasetsave (
    Complaint_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Complaint_Date DATE,
    Complaint_Type VARCHAR(100),
    Priority VARCHAR(30),
    Status VARCHAR(30),
    Resolution_Days INT NULL,
    Channel VARCHAR(50)
);


CREATE TABLE fraud_datasetsave (
    Fraud_ID VARCHAR(20),
    Transaction_ID VARCHAR(20),
    Fraud_Flag VARCHAR(10),
    Fraud_Type VARCHAR(100),
    Risk_Score INT,
    Investigation_Status VARCHAR(50)
);


SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'secure_file_priv';
SELECT VERSION();

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/transaction_sav (1).csv"
INTO TABLE transaction_sav
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Queires-- 

CREATE VIEW vw_total_female_customers AS
SELECT COUNT(DISTINCT Customer_ID) AS Total_FemaleCustomer
FROM customer_datasetsave
WHERE GENDER = 'FEMALE';


CREATE VIEW vw_total_male_customers AS
SELECT COUNT(DISTINCT Customer_ID) AS Total_maleCustomer
FROM customer_datasetsave
WHERE GENDER = 'MALE';


CREATE VIEW vw_total_customers_uttar_pradesh AS
SELECT COUNT(DISTINCT Customer_ID) AS Total_FemaleCustomer
FROM customer_datasetsave
WHERE STATE = 'UTTAR PRADESH';


CREATE VIEW vw_total_customers_west_bengal AS
SELECT COUNT(DISTINCT Customer_ID) AS Total_FemaleCustomer
FROM customer_datasetsave
WHERE STATE = 'WEST BENGAL';


CREATE VIEW vw_total_customers_gujarat AS
SELECT COUNT(DISTINCT Customer_ID) AS Total_FemaleCustomer
FROM customer_datasetsave
WHERE STATE = 'GUJARAT';


CREATE VIEW vw_total_account_balance AS
SELECT SUM(Balance) AS total_account_balance
FROM account_datasetsave;


CREATE VIEW vw_average_account_balance AS
SELECT ROUND(AVG(Balance), 2) AS AVG_account_balance
FROM account_datasetsave;


CREATE VIEW vw_active_accounts AS
SELECT COUNT(DISTINCT Customer_ID) AS Active_Account
FROM account_datasetsave
WHERE Account_Status = 'Active';


CREATE VIEW vw_closed_accounts AS
SELECT COUNT(DISTINCT Customer_ID) AS Active_Account
FROM account_datasetsave
WHERE Account_Status = 'Closed';


CREATE VIEW vw_dormant_accounts AS
SELECT COUNT(DISTINCT Customer_ID) AS Active_Account
FROM account_datasetsave
WHERE Account_Status = 'Dormant';


CREATE VIEW vw_top10_customer_balance AS
SELECT Balance AS Top_10_CustomersBalance
FROM account_datasetsave
ORDER BY Balance DESC
LIMIT 10;


CREATE VIEW vw_monthly_account_opening AS
SELECT
    YEAR(STR_TO_DATE(Open_Date,'%Y-%m-%d')) AS Year,
    MONTH(STR_TO_DATE(Open_Date,'%Y-%m-%d')) AS Month_Number,
    MONTHNAME(STR_TO_DATE(Open_Date,'%Y-%m-%d')) AS Month_Name,
    COUNT(Account_ID) AS Total_Accounts_Opened
FROM account_datasetsave
GROUP BY
    YEAR(STR_TO_DATE(Open_Date,'%Y-%m-%d')),
    MONTH(STR_TO_DATE(Open_Date,'%Y-%m-%d')),
    MONTHNAME(STR_TO_DATE(Open_Date,'%Y-%m-%d'))
ORDER BY
    Year,
    Month_Number;


CREATE VIEW vw_branch_wise_summary AS
SELECT
    Branch_ID,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Balance) AS Total_Deposits,
    ROUND(AVG(Balance), 2) AS Average_Balance
FROM account_datasetsave
GROUP BY Branch_ID;


CREATE VIEW vw_overdue_loans AS
SELECT
    Loan_ID,
    Customer_ID,
    Loan_Type,
    Loan_Amount,
    Outstanding_Principal,
    Days_Past_Due
FROM loan_datasetsave
WHERE Days_Past_Due > 30
ORDER BY Days_Past_Due DESC;


CREATE VIEW vw_credit_card_utilization AS
SELECT
    Card_ID,
    Customer_ID,
    Card_Type,
    Credit_Limit,
    Available_Limit,
    (Credit_Limit - Available_Limit) AS Utilized_Amount,
    ROUND(
        ((Credit_Limit - Available_Limit) / Credit_Limit) * 100,
        2
    ) AS Utilization_Percentage
FROM credit_datasetsave
ORDER BY Utilization_Percentage DESC;


CREATE VIEW vw_complaint_resolution_summary AS
SELECT
    Complaint_Type,
    Status,
    ROUND(AVG(Resolution_Days),2) AS Avg_Resolution_Days
FROM complaints_datasetsave
GROUP BY
    Complaint_Type,
    Status
ORDER BY Avg_Resolution_Days DESC;