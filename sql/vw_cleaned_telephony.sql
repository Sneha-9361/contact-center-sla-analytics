-- =============================================================================
-- DAY 6: PRODUCTION REPORTING VIEW - CLEAN TELEPHONY DATASET
-- Purpose: Remove negative duration anomalies, logic flaws, and orphaned agents
-- =============================================================================

CREATE VIEW vw_cleaned_telephony AS
SELECT 
    f.Call_ID,
    f.Call_Timestamp,
    f.Department,
    f.Wait_Time_Sec,
    f.Talk_Time_Sec,
    f.Status,
    f.Hangup_Reason,
    f.Agent_ID,
    a.Agent_Name,
    a.Shift_Type,
    -- SLA Compliance Indicator: 1 if answered within 20s target, 0 otherwise
    CASE 
        WHEN f.Status = 'Answered' AND f.Wait_Time_Sec <= 20 THEN 1
        ELSE 0 
    END AS Is_SLA_Compliant,
    -- Contractual SLA Breach Indicator: 1 if call breached the 20s SLA threshold
    CASE 
        WHEN f.Status = 'Answered' AND f.Wait_Time_Sec > 20 THEN 1
        WHEN f.Status = 'Abandoned' AND f.Wait_Time_Sec > 20 THEN 1
        ELSE 0 
    END AS Is_SLA_Breach
FROM fact_calls_raw f
LEFT JOIN dim_agents a 
       ON f.Agent_ID = a.Agent_ID
WHERE 
    -- 1. Eliminate clock synchronization defects (negative durations)
    f.Wait_Time_Sec >= 0
    AND f.Talk_Time_Sec >= 0
    -- 2. Eliminate logical status conflicts (abandoned calls with talk time)
    AND NOT (f.Status = 'Abandoned' AND f.Talk_Time_Sec > 0)
    -- 3. Eliminate orphaned agent assignments on answered calls
    AND (f.Status = 'Abandoned' OR (f.Status = 'Answered' AND a.Agent_ID IS NOT NULL));

/*
=============================================================================
DAY 6 SUMMARY & SKILLS LEARNED:
- ETL / Transformation Logic: Filtered out negative queue durations and 
  telephony clock drift anomalies before analytical modeling.
- Business Logic Enforcement: Removed impossible status conflicts where 
  abandoned calls logged talk time.
- Data Integrity: Guaranteed referential integrity by excluding answered 
  calls with orphaned agent identifiers.
- Feature Engineering: Created pre-calculated flags for SLA compliance 
  (<= 20s) and contractual breach events.
- Git Milestone: Day 6 reporting transformation view completed.
=============================================================================
*/