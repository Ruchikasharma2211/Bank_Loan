SELECT * FROM FINANCIAL_LOAN;

SELECT COUNT(ID) AS Total_Loan_Applications FROM Financial_Loan;

--# MTD - MONTH TO DATE
SELECT COUNT(ID) AS MTD_Total_Loan_Applications FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE) = 2021;

--# PMTD - PREVIOUS MONTH TO DATE
SELECT COUNT(ID) AS PMTD_Total_Loan_Applications FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE) = 2021;

SELECT SUM(LOAN_AMOUNT) AS MTD_Total_Funded_Amount FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE) = 2021;

SELECT SUM(LOAN_AMOUNT) AS PMTD_Total_Funded_Amount FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE) = 2021;

SELECT SUM(TOTAL_PAYMENT) AS MTD_Total_Amount_Received FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE) = 2021;

SELECT SUM(TOTAL_PAYMENT) AS PMTD_Total_Amount_Received FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE) = 2021;

SELECT ROUND(AVG(INT_RATE),4)*100 AS MTD_Avg_Interest_Rate FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE) = 2021;

SELECT ROUND(AVG(INT_RATE),4)*100 AS PMTD_Avg_Interest_Rate FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE) = 2021;

SELECT ROUND(AVG(DTI),4)*100 AS MTD_AVG_DTI FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE) = 2021;

SELECT ROUND(AVG(DTI),4)*100 AS PMTD_AVG_DTI FROM Financial_Loan
WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE) = 2021;

SELECT (COUNT
(CASE
     WHEN LOAN_STATUS = 'Fully Paid' OR LOAN_STATUS = 'CURRENT'
	 THEN ID
 END)*100.0) / COUNT(ID) AS Good_Loan_Percentage
 FROM Financial_Loan;

 SELECT COUNT(ID) as Good_Loan_Applications FROM Financial_Loan
 WHERE LOAN_STATUS = 'Fully Paid' OR LOAN_STATUS = 'CURRENT';

 SELECT SUM(LOAN_AMOUNT) as Good_Loan_Funded_Amount FROM Financial_Loan
 WHERE LOAN_STATUS = 'Fully Paid' OR LOAN_STATUS = 'CURRENT';

 SELECT SUM(total_payment) as Good_Loan_Received_Amount FROM Financial_Loan
 WHERE LOAN_STATUS = 'Fully Paid' OR LOAN_STATUS = 'CURRENT';

 SELECT (COUNT(CASE WHEN LOAN_STATUS = 'Charged Off' THEN ID END)*100.0) / COUNT(ID) AS Bad_Loan_Percentage
 FROM Financial_Loan;

 SELECT COUNT(ID) as Bad_Loan_Applications FROM Financial_Loan
 WHERE LOAN_STATUS = 'Charged Off';

 SELECT SUM(LOAN_AMOUNT) as Bad_Loan_Funded_Amount FROM Financial_Loan
 WHERE LOAN_STATUS = 'Charged Off';

 SELECT SUM(total_payment) as Bad_Loan_Received_Amount FROM Financial_Loan
 WHERE LOAN_STATUS = 'Charged Off';

 SELECT loan_status,
 COUNT(ID) AS Total_Loan_Applications,
 SUM(total_payment) as Total_Amount_Received,
 SUM(loan_amount) AS Total_Funded_Amount,
 AVG(int_rate*100) AS Interest_Rate,
 AVG(dti*100) AS DTI
 FROM Financial_Loan
 GROUP BY loan_status;

 SELECT loan_status,
 SUM(total_payment) as MTD_Total_Amount_Received,
 SUM(loan_amount) AS MTD_Total_Funded_Amount
 FROM Financial_Loan
 WHERE MONTH(issue_date) = 12
 GROUP BY loan_status;

 SELECT loan_status,
 SUM(total_payment) as PMTD_Total_Amount_Received,
 SUM(loan_amount) AS PMTD_Total_Funded_Amount
 FROM Financial_Loan
 WHERE MONTH(issue_date) = 11
 GROUP BY loan_status;

 SELECT
 MONTH(ISSUE_DATE) AS Month_Number,
 DATENAME(MONTH, issue_date) AS Month_Name,
 COUNT(ID) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Received_Amount
 FROM Financial_Loan
 GROUP BY MONTH(ISSUE_DATE), DATENAME(MONTH, issue_date)
 ORDER BY MONTH(ISSUE_DATE)

 SELECT
 address_state,
 COUNT(ID) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Received_Amount
 FROM Financial_Loan
 GROUP BY address_state
 ORDER BY SUM(loan_amount) DESC;

 SELECT
 term,
 COUNT(ID) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Received_Amount
 FROM Financial_Loan
 GROUP BY term
 ORDER BY term;

 SELECT
 emp_length,
 COUNT(ID) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Received_Amount
 FROM Financial_Loan
 GROUP BY emp_length
 ORDER BY COUNT(ID);

 SELECT
 purpose,
 COUNT(ID) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Received_Amount
 FROM Financial_Loan
 GROUP BY purpose
 ORDER BY COUNT(ID) desc;

 SELECT
 home_ownership,
 COUNT(ID) AS Total_Loan_Applications,
 SUM(loan_amount) AS Total_Funded_Amount,
 SUM(total_payment) AS Total_Received_Amount
 FROM Financial_Loan
 GROUP BY home_ownership
 ORDER BY COUNT(ID) desc;


