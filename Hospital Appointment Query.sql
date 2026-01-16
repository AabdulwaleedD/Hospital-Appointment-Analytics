-- INSPECTING DATA
SELECT * FROM Hospital_Appointment;

SELECT COUNT(*) FROM Hospital_Appointment;

-- UPDATING TABLE
ALTER TABLE Hospital_Appointment
ADD length_of_stay INT;

UPDATE Hospital_Appointment
SET length_of_stay = DATEDIFF(
    DAY,
    date_of_admission,
    discharge_date
);
-- TOTAL REVENUE
SELECT ROUND(SUM(billing_amount), 2) AS Total_Revenue
FROM Hospital_Appointment;

-- Cost by Medical Condition
SELECT medical_condition,
       COUNT(*) AS patients,
       ROUND(AVG(billing_amount), 2) AS avg_cost
FROM Hospital_Appointment
GROUP BY medical_condition
ORDER BY avg_cost DESC;

-- TYPE OF ADMISSION
SELECT admission_type,
       COUNT(*) AS cases,
       AVG(length_of_stay) AS avg_stay
FROM Hospital_Appointment
GROUP BY admission_type;

SELECT Medical_Condition, COUNT(*) AS CASE_COUNT
FROM Hospital_Appointment
GROUP BY Medical_Condition
ORDER BY CASE_COUNT DESC;

-- INSURANCE PROVIDERS IMPACT
SELECT insurance_provider,
       ROUND(SUM(billing_amount), 2) AS total_cost
FROM Hospital_Appointment
GROUP BY insurance_provider
ORDER BY total_cost DESC;

-- AGE to COST IMPACT
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 49 THEN '30–49'
        WHEN age BETWEEN 50 AND 59 THEN '50–59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS patient_count,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    AVG(length_of_stay) AS avg_stay
FROM Hospital_Appointment
GROUP BY age
ORDER BY avg_billing DESC;

-- COST BY MEDICAL CONDITION
SELECT 
    Medical_Condition,
    COUNT(*) AS patients,
    ROUND(AVG(billing_amount), 2) AS avg_cost,
    ROUND(AVG(length_of_stay), 1) AS avg_stay
FROM Hospital_Appointment
GROUP BY Medical_Condition
ORDER BY avg_cost DESC;

-- COST BY ADMISSION TYPE
SELECT 
    admission_type,
    COUNT(*) AS cases,
    ROUND(AVG(billing_amount), 2) AS avg_cost,
    ROUND(AVG(length_of_stay), 1) AS avg_stay
FROM Hospital_Appointment
GROUP BY admission_type;

--IMPACT OF ABNORMAL TEST
SELECT 
    test_results,
    COUNT(*) AS patients,
    ROUND(AVG(billing_amount), 2) AS avg_cost
FROM Hospital_Appointment
GROUP BY test_results;

-- INSURANCE PROVIDERS COST BURDEN
SELECT 
    Insurance_Provider,
    COUNT(*) AS No_Of_Patients,
    ROUND(SUM(billing_amount), 2) AS Total_Billing,
    ROUND(AVG(billing_amount), 2) AS Avg_Billing
FROM Hospital_Appointment
GROUP BY Insurance_Provider
ORDER BY Total_Billing DESC;

-- DOCTORS WORKLOAD
SELECT top 10
    Doctor,
    COUNT(*) AS No_of_Patients,
    ROUND(AVG(length_of_stay), 1) AS avg_stay,
    ROUND(AVG(billing_amount), 2) AS avg_cost
FROM Hospital_Appointment
GROUP BY Doctor
ORDER BY No_of_Patients DESC;

-- ROOM EFFICIENCY
SELECT TOP 10
    Room_Number,
    COUNT(*) AS No_of_Patients,
    ROUND(AVG(length_of_stay), 1) AS avg_stay
FROM Hospital_Appointment
GROUP BY Room_Number
ORDER BY avg_stay DESC;

-- LENGTH OF STAY BY COST
SELECT 
    length_of_stay,
    COUNT(*) AS No_of_Patients,
    ROUND(AVG(billing_amount), 2) AS avg_cost
FROM hospital_appointment
GROUP BY length_of_stay
ORDER BY length_of_stay DESC;

--IDENTIFICATION OF PATIENT WITH HIGH RISK
SELECT Name, Hospital, Billing_Amount, Medical_Condition, Admission_Type,Test_Results,
    (CASE WHEN age >= 60 THEN 2 ELSE 0 END +
     CASE WHEN Medical_Condition IN ('Cancer','Diabetes','Asthma') THEN 3 ELSE 0 END +
     CASE WHEN Admission_Type = 'Emergency' THEN 2 ELSE 0 END +
     CASE WHEN Test_Results = 'Abnormal' THEN 2 ELSE 0 END
    ) AS Risk_Score
FROM Hospital_Appointment;



