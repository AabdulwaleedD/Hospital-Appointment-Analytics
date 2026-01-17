# Hospital-Appointment-Analytics

# Hospital Appointment Analytics Dashboard

**Enterprise-grade Power BI solution enhanced with Python for healthcare performance insights**  
Analyzing 55,500+ patient appointments | $1.42B revenue visibility | Risk scoring | Doctor productivity

![Monthly Summary Dashboard](images/hospital_monthly_summary.png)

## Overview
Interactive Power BI dashboard designed for hospital administrators and healthcare leaders.  
Provides real-time insights into:
- Patient volume & demographics
- Financial performance (revenue, cost per patient, billing by condition/admission)
- Clinical metrics (average length of stay 16 days, risk score 8.9K)
- Operational efficiency (top doctors by revenue, admission types)

Python was used for advanced data preparation, cleaning, transformation, and feature engineering before modeling in Power BI (e.g., handling missing values, standardizing columns formats, creating derived risk features).

## Key Features
- **Dynamic Slicers** → Year, Month, Insurance, Hospital, Gender, Doctor
- **Executive KPIs** → Total patients, revenue trends, avg cost/risk/length of stay
- **Financial Deep Dive** → Revenue by year/condition/type + Top 10 Doctors ranking
- **Clinical Insights** → Length of stay by condition, test result distribution, risk by gender

![Financial Drivers View](images/hospital_financial_drivers.png)

## Tech Stack
- **Python** → Pandas, NumPy for data cleaning, preprocessing, merging sources, outlier detection, and custom calculations
- **Power BI Desktop** → DAX measures, data modeling, slicers, advanced visuals & storytelling
- **Data source** → Anonymized hospital appointments dataset (processed via Python scripts)

## Project Files
- `Hospital_Appointments_Dashboard.pbix` → Main Power BI report
- `python_scripts/` → Folder with Jupyter notebooks or .py files (e.g., `data_cleaning.py`, `preprocessing.ipynb`)
- `images/` → Dashboard screenshots

## How to Use
1. Download the `.pbix` file and open in **Power BI Desktop** (free: https://powerbi.microsoft.com/desktop/)
2. Explore filters & interact with visuals
3. Check the `python_scripts/` folder for the preprocessing code (run locally with Python 3+ and pandas installed)
4. (Optional) Publish to Power BI Service for live sharing

## Connect
- Portfolio: https://aabdulwaleedd.github.io
- LinkedIn: https://www.linkedin.com/in/abdulhamid-abdulwalid-danjuma
- X: @Aabdul_HameedD

Built with 📊 Python, SQL & Power BI ♟️ by Abdulhamid Abdulwalid Danjuma – January 2026  
Star ⭐ the repo if this inspires your healthcare analytics projects!
