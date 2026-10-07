# Enterprise Contact Center: SLA Breach & Queue Capacity Optimizer

An end-to-end data analytics project simulating, auditing, and optimizing contact center operations. This project models inbound telephony call queues, tracks Service Level Agreement (SLA) breaches, identifies peak volume capacity risks, and calculates contract penalty losses.

---

## Project Overview

Enterprise contact centers operate under stringent contractual Service Level Agreements (e.g., answering 80% of incoming customer calls within 20 seconds). Unmitigated call arrival surges and staffing deficits lead to elevated queue wait times, customer abandonments, and direct contractual financial penalties.

This project delivers a full data pipeline:
1. **Telephony Simulation:** Generates synthetic agent rosters and raw Call Detail Records (CDR) with realistic operational distribution and deliberate system anomalies using Python.
2. **SQL Quality Audit & Transformation:** Identifies temporal defects, abandoned call duration discrepancies, and orphaned records before producing clean reporting layers.
3. **Relational Modeling & DAX:** Builds an enterprise Star Schema and Power BI analytical measures quantifying SLA compliance rates, abandonment rates, and breach costs.
4. **Capacity Optimization & Executive Reporting:** Surfaces intraday rush-hour volume spikes to provide actionable workforce capacity adjustments.

---

## Architecture & Project Structure

contact-center-sla-analytics/
├── data/
│   ├── dim_agents.csv              # Generated agent dimension roster (50 agents)
│   ├── fact_calls_raw.csv          # Raw telephony CDR logs (1,200 call events)
│   └── (clean export datasets)     # Target output from SQL transformations
├── notebooks/                      # Exploratory data analysis notebooks
├── powerbi/
│   └── (powerbi reports & models)  # Power BI dashboard (.pbix) & DAX docs
├── scripts/
│   ├── generate_agents.py          # Python generator for agent dimension table
│   └── generate_calls.py           # Python generator for CDR logs with anomalies
├── sql/
│   └── (audit queries & views)     # SQL scripts for data hygiene and audits
└── README.md                       # Project documentation & execution guide

---

## Core Telephony Metrics & Business Rules

* **SLA Compliance Target:** 80% of offered calls answered within 20 seconds.
* **Speed of Answer (ASA):** Mean duration in queue prior to agent connection.
* **Abandonment Rate (%):** Percentage of inbound customer calls terminated by the caller prior to agent connection.
* **First Contact Resolution (FCR):** Proportion of incoming queries addressed without downstream transfers or repeat contacts.
* **Contractual Financial Penalty:** Dollar penalty accrued per customer contact breaching agreed queue wait thresholds.

---

## Delivery Roadmap & Current Progress

| Phase | Milestone | Focus Area | Deliverables / Git Milestones | Status |
| :--- | :--- | :--- | :--- | :--- |
| Phase 1 | Day 1 | Project Setup & Version Control | Local Git setup, repository skeleton, initial documentation | Completed |
| | Day 2 | Agent Dimension Generation | generate_agents.py -> dim_agents.csv (50 agents, shifts, queues) | Completed |
| | Day 3 | Call Detail Records Generation | generate_calls.py -> fact_calls_raw.csv (1,200 records + anomalies) | Completed |
| Phase 2 | Day 4 | SQL Audit: Timestamps & Durations | Audit queries detecting clock sync failures & negative queue waits | Upcoming |
| | Day 5 | SQL Audit: Business Logic Flaws | Audit queries isolating abandonments with talk time & orphaned IDs | Upcoming |
| | Day 6 | Transformation & Reporting Views | vw_cleaned_telephony.sql producing production-ready data tables | Upcoming |
| Phase 3 | Day 7 | Power BI Model Ingestion | Loading clean tables, schema typing, dedicated _Measures table | Upcoming |
| | Day 8 | Star Schema Relationship Design | 1-to-Many single-direction relationships (Dim_Agent, Dim_Date) | Upcoming |
| Phase 4 | Day 9 | DAX: Volume & Abandonment | DAX measures for [Total Calls], [Answered Calls], [Abandonment %] | Upcoming |
| | Day 10 | DAX: SLA Compliance Logic | DAX measures for [Calls Answered <= 20s], [SLA Compliance %] | Upcoming |
| | Day 11 | DAX: Financial Penalty Model | DAX measures for [SLA Breach Count], [Estimated Penalty Loss ($)] | Upcoming |
| Phase 5 | Day 12 | Executive KPI Dashboard View | High-level operational cards for SLAs, drop-off, and contractual risk | Upcoming |
| | Day 13 | Queue Arrival & Peak Intervals | Intraday rush-hour volume distribution charts & capacity matrices | Upcoming |
| | Day 14 | Portfolio Wrap-up & Review | Executive summary, operational findings, and capacity recommendations | Upcoming |

---

## Step-by-Step Execution Guide (Completed Steps)

### 1. Repository Setup & Directory Initialization
```bash
mkdir contact-center-sla-analytics && cd contact-center-sla-analytics
git init
mkdir data scripts sql powerbi
