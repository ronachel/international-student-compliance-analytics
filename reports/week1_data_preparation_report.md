# Week 1 Data Preparation Report

## International Student Eligibility, Compliance, and Enrollment Data Analysis

**Prepared by:** Ronachel Marie Digma
**Team:** Team 7
**Internship:** Data Visualization Associate Internship
**Week:** Week 1 — Data Understanding & Preparation

---

# 1. Dataset Overview & Documentation

## 1.1 Introduction

The objective of Week 1 was to establish a structured, validated, and analysis-ready analytical foundation for subsequent compliance analysis and dashboard development. This phase focused on understanding the structure and relationships between institutional datasets related to international student eligibility, enrollment document compliance, and government fee payment records.

Three institutional datasets were examined:

* Applicant Dataset
* Connect Dataset
* SEVIS Dataset

The workflow involved dataset profiling, data quality assessment, duplicate validation, preprocessing, categorical standardization, and relational integration.

All preprocessing and validation procedures were performed using Python (Pandas) within Google Colab.

---

## 1.2 Dataset Structure Summary

| Dataset   | Description                                                      | Rows   | Columns |
| --------- | ---------------------------------------------------------------- | ------ | ------- |
| Applicant | Applicant eligibility, financial, and enrollment-related records | 34,341 | 24      |
| Connect   | Operational tracking and I-20 processing information             | 34,341 | 8       |
| SEVIS     | Government compliance and immigration-related records            | 3,435  | 126     |

The datasets contain a mixture of:

* Categorical variables
* Numerical variables
* Date/time fields
* Identifier fields
* Operational status indicators

---

## 1.3 Key Variables and Dataset Themes

### Applicant Dataset

The Applicant dataset primarily contains:

* Financial documentation indicators
* Eligibility-related fields
* Deposit and scholarship information
* English language requirement status
* Enrollment review indicators
* I-20 processing status

Examples of key fields include:

* `Reference_ID`
* `Deposit_Status`
* `Bank_Statement`
* `Sponsor_Letter`
* `I-20_Status`
* `Total_Funding_Amt`
* `Date_of_Review`

This dataset serves as the primary source for applicant-level eligibility and compliance assessment.

---

### Connect Dataset

The Connect dataset contains operational workflow and applicant tracking information.

Examples include:

* `Reference_ID`
* `Assigned`
* `University`
* `Deposit_Status`
* `I_20_Status`
* `Created_At`
* `Modified_At`

This dataset provides operational visibility into enrollment processing and workflow assignment.

---

### SEVIS Dataset

The SEVIS dataset contains government compliance and immigration-related records.

Examples include:

* `SEVIS_ID`
* `NonImmigrant_ID`
* `FIN_ID`
* `SEVIS_Status`
* `Class_of_Admission`
* `I_901_Fee_Payment_Receipt`
* `Status_Change_Date`

The dataset focuses on immigration status tracking, compliance monitoring, and federal reporting requirements.

---

## 1.4 Variable Types

The datasets contain the following variable categories:

| Variable Type         | Description                                                |
| --------------------- | ---------------------------------------------------------- |
| Identifier Fields     | Unique operational or applicant identifiers                |
| Categorical Variables | Eligibility status, deposit status, assignment indicators  |
| Numerical Variables   | Funding amounts, estimated expenses, scholarship values    |
| Date Variables        | Review dates, creation timestamps, modification timestamps |
| Compliance Indicators | Document submission and government fee payment fields      |

Date-related variables required conversion into standardized datetime format to ensure consistency during downstream analysis.

---

## 1.5 Initial Structural Observations

Initial dataset inspection revealed several important structural characteristics:

1. Significant duplication existed within both Applicant and Connect datasets.
2. Multiple financial and document-related fields contained substantial missingness.
3. Operational status indicators showed inconsistent categorical formatting.
4. The SEVIS dataset lacked a direct shared identifier with Applicant and Connect datasets.
5. Several compliance-related fields appeared sparsely populated or structurally incomplete.

These observations informed the preprocessing and validation strategy implemented during Week 1.

---

# 2. Data Cleaning & Processing Summary

## 2.1 Missing Value Assessment

A structured missing value analysis was conducted across all datasets using Pandas.

Both absolute missing counts and missing percentages were calculated for each variable.

The analysis identified substantial missingness in several financial and compliance-related fields, particularly within:

* Funding-related variables
* Scholarship indicators
* Document submission fields
* Government payment-related attributes

Several fields exhibited near-complete or complete missingness, suggesting either:

* incomplete operational population,
* unavailable source data,
* or inactive data collection pipelines.

This represents a significant analytical limitation that must be considered in subsequent dashboard interpretation.

---

## 2.2 Duplicate Record Assessment

Duplicate record analysis revealed extensive duplication within the Applicant and Connect datasets.

### Duplicate Results

| Dataset   | Duplicate Reference_ID Values |
| --------- | ----------------------------- |
| Applicant | 27,466                        |
| Connect   | 27,466                        |

The duplication pattern suggested the existence of multiple operational records associated with individual applicants.

Initial integration attempts resulted in a many-to-many join condition, producing substantial row inflation and compromising dataset integrity.

To address this issue, duplicate records were removed using `Reference_ID` as the primary uniqueness constraint.

The following preprocessing logic was applied:

```python
applicant_clean = applicant.drop_duplicates(subset='Reference_ID').copy()
connect_clean = connect.drop_duplicates(subset='Reference_ID').copy()
```

This preprocessing step ensured one-to-one relational consistency prior to integration.

---

## 2.3 Data Standardization

Several preprocessing operations were performed to improve dataset consistency.

### String Cleaning

Whitespace normalization was applied across object-type variables using string stripping operations.

### Date Standardization

Date and timestamp variables were converted into standardized datetime format using:

```python
pd.to_datetime(errors='coerce')
```

This ensured temporal consistency and reduced parsing ambiguity.

### Categorical Standardization

Operational status indicators such as `Deposit_Status` were standardized using uppercase normalization.

This reduced category fragmentation and improved consistency during aggregation.

---

## 2.4 Preprocessing Summary

The following preprocessing tasks were completed:

| Preprocessing Task          | Status    |
| --------------------------- | --------- |
| Missing value assessment    | Completed |
| Duplicate validation        | Completed |
| Duplicate removal           | Completed |
| String normalization        | Completed |
| Datetime conversion         | Completed |
| Categorical standardization | Completed |
| Merge preparation           | Completed |

These steps established a reliable and analysis-ready dataset for downstream compliance analysis.

---

# 3. Data Integration & Validation

## 3.1 Integration Strategy

The Applicant and Connect datasets were integrated using `Reference_ID` as the primary relational key.

A LEFT JOIN strategy was implemented to preserve all applicant records while incorporating operational tracking information from the Connect dataset.

The integration logic was implemented as follows:

```python
merged = applicant_clean.merge(connect_clean, on='Reference_ID', how='left')
```

This ensured retention of all cleaned applicant records regardless of matching operational status information.

---

## 3.2 Merge Validation

Following duplicate removal and integration, merge validation checks were conducted.

### Validation Results

| Validation Metric    | Value |
| -------------------- | ----- |
| Applicant Clean Rows | 6,875 |
| Final Merged Rows    | 6,875 |

The absence of row inflation after integration confirmed successful mitigation of the earlier many-to-many join issue.

This indicates that the cleaned datasets maintained one-to-one mapping consistency using `Reference_ID`.

---

## 3.3 SEVIS Integration Limitation

A structural integration assessment was conducted between the SEVIS dataset and the Applicant/Connect datasets.

However, no reliable shared identifier was identified.

Specifically:

* `Reference_ID` was absent from the SEVIS dataset.
* No stable operational foreign key was available for deterministic joining.

As a result, full relational integration between SEVIS and the other datasets could not be reliably performed.

This represents a significant architectural limitation within the institutional data ecosystem and may affect future compliance analysis involving immigration-related metrics.

Potential future solutions may include:

* surrogate key generation,
* deterministic mapping tables,
* or probabilistic entity resolution techniques.

---

## 3.4 Data Quality Risks and Limitations

Several limitations were identified during Week 1 processing:

1. High missingness across financial and compliance-related fields.
2. Extensive duplication within operational datasets.
3. Structural inconsistency between institutional systems.
4. Limited interoperability between SEVIS and operational datasets.
5. Potential historical record accumulation causing duplicate proliferation.

These limitations may affect:

* dashboard completeness,
* compliance metric accuracy,
* and downstream analytical interpretation.

Careful validation will therefore remain necessary in subsequent analytical phases.

---

# 4. Initial Structural Observations

## 4.1 Eligibility Distribution

Initial analysis of the `I_20_Status` field revealed an uneven eligibility distribution.

Approximately:

* 65% of records were categorized as “No”
* 35% were categorized as “Yes”

This may indicate:

* incomplete eligibility progression,
* pending processing pipelines,
* or operational bottlenecks in I-20 issuance workflows.

Further exploratory analysis will be conducted during Week 2.

---

## 4.2 Deposit Status Distribution

Deposit-related fields demonstrated variation in applicant financial commitment status.

Preliminary analysis suggests that deposit completion rates are not uniformly distributed across applicants.

This may have implications for:

* enrollment forecasting,
* operational follow-up prioritization,
* and conversion analysis.

---

## 4.3 Document Compliance Completeness

Several document-related variables exhibited substantial missingness.

This may indicate:

* incomplete applicant submissions,
* inconsistent operational tracking,
* or limitations in source system synchronization.

Document completeness validation will be explored further during Week 2 compliance analysis.

---

## 4.4 Government Fee Payment Coverage

Although the SEVIS dataset contains government compliance-related information, direct integration with operational datasets could not be performed due to identifier incompatibility.

Consequently, full institutional-level linkage between applicant records and government fee payment status remains limited.

This represents a significant analytical and operational visibility gap.

---

# 5. Conclusion

Week 1 successfully established a structured and validated analytical foundation for downstream compliance analysis and dashboard development.

The workflow included:

* dataset profiling,
* data quality assessment,
* duplicate validation,
* preprocessing,
* categorical standardization,
* relational integration,
* and merge validation.

Critical structural limitations were identified, including duplicate proliferation and limited interoperability between institutional systems.

Despite these challenges, a reliable and analysis-ready merged dataset was successfully produced for future analytical tasks.

The resulting dataset and documentation now provide a strong operational foundation for Week 2 exploratory compliance analysis and dashboard-oriented insight generation.
