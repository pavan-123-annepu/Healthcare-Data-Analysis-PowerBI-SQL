CREATE TABLE Healthcare (
    Patient_Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Blood_Type  VARCHAR(5),
    Medical_Condition VARCHAR(100),
    Date_of_Admission VARCHAR(50), 
    Doctor VARCHAR(100),
    Hospital VARCHAR(100),
    Insurance_Provider VARCHAR(50),
    Billing_Amount DECIMAL(10, 2),
    Room_Number INT,
    Admission_Type VARCHAR(50),
    Discharge_Date VARCHAR(50),    
    Medication VARCHAR (100),
    Test_Results VARCHAR(100)
);


--1. Medical Condition vs Billing (Top Revenue)

SELECT 
    Medical_Condition, 
    COUNT(*) AS Total_Patients,
    ROUND(SUM(Billing_Amount), 2) AS Total_Revenue,
    ROUND(AVG(Billing_Amount), 2) AS Average_Bill
FROM Healthcare
GROUP BY Medical_Condition
ORDER BY Total_Revenue DESC;

--2.Peak Admission Months (Trend Analysis)

     SELECT 
    MONTHNAME(Date_of_Admission) AS Month_Name, 
    COUNT(*) AS Admission_Count
FROM Healthcare
GROUP BY Month_Name
ORDER BY Admission_Count DESC;

--3. Patient Recovery Speed

SELECT 
    Admission_Type,
    AVG(DATEDIFF(Discharge_Date, Date_of_Admission)) AS Avg_Stay_Days
FROM Healthcare
GROUP BY Admission_Type;

--4 Patient Count by Age Group
 
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Kids (0-17)'
        WHEN Age BETWEEN 18 AND 45 THEN 'Youth (18-45)'
        WHEN Age BETWEEN 46 AND 60 THEN 'Middle Age (46-60)'
        ELSE 'Senior Citizens (60+)'
    END AS Age_Category,
    COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Age_Category
ORDER BY Total_Patients DESC;

--5 Doctors with Most Patients

SELECT Doctor, COUNT(Patient_Name) AS Patient_Count
FROM healthcare
GROUP BY Doctor
ORDER BY Patient_Count DESC
LIMIT 5;

