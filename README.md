# Enterprise Contact Center: SLA Breach & Queue Capacity Optimizer

An end-to-end data analytics project simulating, auditing, and optimizing contact center operations. This project models inbound telephony call queues, tracks Service Level Agreement (SLA) breaches, identifies peak volume capacity risks, and calculates contract penalty losses.

---

## 📌 Project Overview

Enterprise contact centers operate under stringent contractual Service Level Agreements (e.g., answering 80% of incoming customer calls within 20 seconds). Unmitigated call arrival surges and staffing deficits lead to elevated queue wait times, customer abandonments, and direct contractual financial penalties.

This project delivers a full data pipeline:
1. **Telephony Simulation:** Generates synthetic agent rosters and raw Call Detail Records (CDR) with realistic operational distribution and deliberate system anomalies using Python[span_4](start_span)[span_4](end_span)[span_5](start_span)[span_5](end_span).
2. **SQL Quality Audit & Transformation:** Identifies temporal defects, abandoned call duration discrepancies, and orphaned records before producing clean reporting layers[span_6](start_span)[span_6](end_span)[span_7](start_span)[span_7](end_span).
3. **Relational Modeling & DAX:** Builds an enterprise Star Schema and Power BI analytical measures quantifying SLA compliance rates, abandonment rates, and breach costs[span_8](start_span)[span_8](end_span)[span_9](start_span)[span_9](end_span).
4. **Capacity Optimization & Executive Reporting:** Surfaces intraday rush-hour volume spikes to provide actionable workforce capacity adjustments[span_10](start_span)[span_10](end_span)[span_11](start_span)[span_11](end_span).

---

## 🏗️ Architecture & Project Structure

```text
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
