# International Student Compliance Risk Intelligence System

SQL-driven operational analytics platform for monitoring international student enrollment compliance, identifying risk clusters, and supporting institutional decision-making.

---

# Project Overview

International student enrollment operations involve multiple compliance checkpoints across admissions, document verification, payment processing, and advisor assignment.

These processes often span disconnected operational systems, making it difficult to monitor student progression, identify at-risk students early, and allocate staff resources efficiently.

This project was developed to centralize student compliance monitoring through SQL-based analytics and dashboard reporting.

Using PostgreSQL and Looker Studio, this project integrates institutional student records into a unified analytics workflow for monitoring compliance performance, operational bottlenecks, and student risk exposure.

---

# Business Problem

Without centralized compliance reporting, institutions face challenges such as:

- incomplete deposit verification
- delayed I-20 processing
- high numbers of unassigned students
- uneven advisor workload distribution
- limited visibility into student risk pipelines

These issues can delay enrollment progression and create operational inefficiencies.

This project addresses those challenges by creating a compliance monitoring and operational intelligence dashboard.

---

# Objectives

This project aims to:

- monitor international student compliance metrics
- identify high-risk student segments requiring intervention
- track deposit completion and I-20 approval rates
- monitor advisor assignment coverage
- analyze workload distribution across advisors
- support operational reporting through dashboard-based decision-making

---

# Dataset

Merged institutional dataset built from:

### Applicant Dataset
Student eligibility, financial, and enrollment-related records

### Connect Dataset
Operational tracking and I-20 processing information

### SEVIS Dataset
Government compliance and immigration-related records

---

# Final Dataset Summary

| Metric | Value |
|---|---:|
| Total Students | 6,875 |
| Deposit Completed | 1,512 |
| I-20 Approved | 2,389 |
| High Risk Students | 4,224 |
| Unassigned Students | 3,962 |

---

# Tech Stack

- PostgreSQL
- SQL
- Google Looker Studio
- GitHub
- Python (Pandas for preprocessing)

---

# Data Workflow

Raw CSV Files  
↓  
Data Cleaning & Validation  
↓  
Duplicate Removal  
↓  
PostgreSQL Data Import  
↓  
SQL Aggregation & Metric Validation  
↓  
Dashboard Development in Looker Studio  
↓  
Compliance Risk Monitoring & Reporting  

---

# Key Insights

## 1. Large High-Risk Student Population

4,224 students were identified as high risk due to:

- missing deposit completion
- missing I-20 approval

This represents the largest operational compliance risk segment.

---

## 2. Low Deposit Compliance Rate

Only 1,512 out of 6,875 students completed deposit requirements.

This indicates possible financial compliance bottlenecks affecting enrollment progression.

---

## 3. Uneven Advisor Workload Distribution

Advisor assignment analysis showed concentration of student caseloads among a limited number of staff members.

Top advisor combinations handled 300+ student records while thousands remained unassigned.

---

## 4. Large Unassigned Population

3,962 students remained unassigned to advisors.

This suggests possible workflow backlog or staffing imbalance.

---

# Compliance Risk Segmentation

A rule-based Compliance Risk Score was introduced to classify students requiring operational attention.

Scoring criteria:

- Deposit Status = No → 40 points
- I20 Status = No → 40 points
- Unassigned = 20 points

## Risk Distribution

| Risk Level | Total Students |
|---|---:|
| High Risk | 4224 |
| Medium Risk | 1401 |
| Low Risk | 1250 |

This segmentation framework supports prioritization of high-risk student populations for institutional intervention and compliance monitoring.

---

# Compliance Risk Score Model

A rule-based Compliance Risk Score was developed to prioritize students requiring intervention.

Scoring Logic:

- Deposit Status = No → +40 points
- I-20 Status = No → +40 points
- Unassigned = +20 points

Risk Segments:

| Score | Risk Level |
|---|---|
| 0–20 | Low Risk |
| 21–60 | Medium Risk |
| 61–100 | High Risk |

This scoring framework helps prioritize outreach and operational action.

---

# Dashboard

Interactive dashboard includes:

- Total Students KPI
- Deposit Compliance Monitoring
- I-20 Status Monitoring
- Student Assignment Monitoring
- Advisor Workload Distribution
- Compliance Risk Segmentation

Dashboard Link:

[Looker Studio Link](https://datastudio.google.com/reporting/1ad71f21-3117-47ae-9dfa-1542265cfdfa)

---

# Future Improvements

Possible next iterations:

- time-series compliance monitoring
- automated risk alerts
- advisor workload forecasting
- predictive student risk modeling
- compliance completion trend analysis

