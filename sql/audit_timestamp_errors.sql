-- =============================================================================
-- DAY 4: DATA QUALITY AUDIT - NEGATIVE DURATIONS & CLOCK DRIFT
-- =============================================================================

-- Query 1: Flag negative queue wait times (clock synchronization defects)
SELECT 
    Call_ID,
    Call_Timestamp,
    Department,
    Wait_Time_Sec,
    Status,
    'CRITICAL: Negative Wait Duration (Clock Drift)' AS Issue_Description
FROM fact_calls_raw
WHERE Wait_Time_Sec < 0;

-- Query 2: Flag negative talk times (corrupt handle durations)
SELECT 
    Call_ID,
    Call_Timestamp,
    Department,
    Talk_Time_Sec,
    Status,
    'CRITICAL: Negative Handle Duration' AS Issue_Description
FROM fact_calls_raw
WHERE Talk_Time_Sec < 0;

/* 
=============================================================================
DAY 4 SUMMARY & SKILLS LEARNED:
- Telephony Anomaly Detection: Identified impossible negative durations caused 
  by server clock drifts in inbound telephony systems.
- Data Quality Assurance: Isolated negative wait times and handle times to ensure 
  raw records are flagged before computing Speed of Answer (ASA) and AHT.
- Git Milestone: Day 4 SQL audit script completed.
=============================================================================
*/