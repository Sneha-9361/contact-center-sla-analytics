# Enterprise Contact Center: SLA Breach & Queue Capacity Optimizer

An end-to-end data analytics project simulating, auditing, and optimizing contact center operations. This project models inbound telephony call queues, tracks Service Level Agreement (SLA) breaches, identifies peak volume capacity risks, and calculates contract penalty losses.

---

## 📌 Project Overview

Enterprise contact centers operate under stringent contractual Service Level Agreements (e.g., answering 80% of incoming customer calls within 20 seconds). Unmitigated call arrival surges and staffing deficits lead to elevated queue wait times, customer abandonments, and direct contractual financial penalties.

This project delivers a full data pipeline:
1. **Telephony Simulation:** Generates synthetic agent rosters and raw Call Detail Records (CDR) with realistic operational distribution and deliberate system anomalies using Python.
2. **SQL Quality Audit & Transformation:** Identifies temporal defects, abandoned call duration discrepancies, and orphaned records before producing clean reporting layers.
3. **Relational Modeling & DAX:** Builds an enterprise Star Schema and Power BI analytical measures quantifying SLA compliance rates, abandonment rates, and breach costs.
4. **Capacity Optimization & Executive Reporting:** Surfaces intraday rush-hour volume spikes to provide actionable workforce capacity adjustments.

---

## 🏗️ Architecture & Project Structure

```text
contact-center-sla-analytics/
├── data/
│   ├── dim_agents.csv              # Generated agent dimension roster (50 agents)
│
