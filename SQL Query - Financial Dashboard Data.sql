-- =========================================
-- 1. CREATE DATABASE
-- =========================================
CREATE DATABASE IF NOT EXISTS ccdb;
USE ccdb;

-- =========================================
-- 2. DROP TABLES (AVOID DUPLICATE ERRORS)
-- =========================================
DROP TABLE IF EXISTS cc_detail;
DROP TABLE IF EXISTS cust_detail;

-- =========================================
-- 3. CREATE cc_detail TABLE
-- =========================================
CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date varchar(20),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- =========================================
-- 4. CREATE cust_detail TABLE
-- =========================================
CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(10),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- =========================================
-- 5. LOAD DATA INTO cc_detail
-- (Make sure file is in Uploads folder)
-- =========================================
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_card.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,
 Week_Start_Date, Week_Num, Qtr, current_year, Credit_Limit,
 Total_Revolving_Bal, Total_Trans_Amt, Total_Trans_Ct,
 Avg_Utilization_Ratio, Use_Chip, Exp_Type, Interest_Earned, Delinquent_Acc);

-- =========================================
-- 6. LOAD DATA INTO cust_detail
-- =========================================
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Client_Num, Customer_Age, Gender, Dependent_Count, Education_Level,
 Marital_Status, State_cd, Zipcode, Car_Owner, House_Owner,
 Personal_Loan, Contact, Customer_Job, Income, Cust_Satisfaction_Score);

-- =========================================
-- 7. VERIFY DATA
-- =========================================
SELECT COUNT(*) AS cc_rows FROM cc_detail;
SELECT COUNT(*) AS cust_rows FROM cust_detail;

SELECT * FROM cc_detail LIMIT 5;
SELECT * FROM cust_detail LIMIT 5;