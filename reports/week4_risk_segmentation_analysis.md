# Week 4 — Compliance Risk Segmentation Analysis

## Overview

This analysis introduces a rule-based Compliance Risk Score framework to identify and prioritize students requiring operational intervention.

The model classifies students based on:

- Deposit completion status
- I-20 approval status
- Advisor assignment status

---

# Risk Scoring Logic

Scoring rules:

- Deposit Status = No → 40 points
- I20 Status = No → 40 points
- Unassigned → 20 points

---

# Risk Levels

| Risk Level | Total Students |
|---|---:|
| High Risk | 4224 |
| Medium Risk | 1401 |
| Low Risk | 1250 |

---

# Key Findings

## High Risk Students
4,224 students fall under High Risk.

These students typically have:

- incomplete deposit requirements
- incomplete I20 processing

This represents the institution’s largest operational risk cluster.

---

## Medium Risk Students
1,401 students fall under Medium Risk.

These students have partial compliance completion and may require follow-up.

---

## Low Risk Students
1,250 students fall under Low Risk.

These students generally demonstrate completed compliance milestones and lower operational concern.

---

# Business Value

This model allows operations teams to:

- prioritize student outreach
- identify compliance bottlenecks earlier
- monitor unresolved risk clusters
- improve intervention workflows
- support resource allocation decisions