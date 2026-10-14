-- =============================================================================
-- DAY 5: DATA QUALITY AUDIT - BUSINESS LOGIC CONFLICTS & ORPHANED AGENTS
-- Purpose: Flag impossible call statuses and missing foreign key relationships
-- =============================================================================

-- Query 1: Flag abandoned calls with recorded talk time (Logic conflict)
SELECT 
    Call_ID,
    Call_Timestamp,
    Department,
    Wait_Time_Sec,
    Talk_Time_Sec,
    Status,
    'LOGIC FLAW: Abandoned Call Logging Non-Zero Talk Time' AS Issue_Description
FROM fact_calls_raw
WHERE Status = 'Abandoned' 
  AND Talk_Time_Sec > 0;

-- Query 2: Flag orphaned records (Agent ID not found in dim_agents roster)
SELECT 
    f.Call_ID,
    f.Call_Timestamp,
    f.Agent_ID,
    f.Department,
    f.Status,
    'ORPHAN RECORD: Assigned Agent Not Found in Dim_Agents' AS Issue_Description
FROM fact_calls_raw f
LEFT JOIN dim_agents a 
       ON f.Agent_ID = a.Agent_ID
WHERE f.Status = 'Answered' 
  AND a.Agent_ID IS NULL;

/* 
=============================================================================
DAY 5 SUMMARY & SKILLS LEARNED:
- Telephony Logic Validation: Detected abandoned calls erroneously logging 
  handling duration, which distorts Average Handling Time (AHT).
- Relational Integrity (Foreign Keys): Used a LEFT JOIN to isolate orphaned 
  records (Agent ID 999) missing from the dim_agents master roster.
- Git Milestone: Day 5 SQL audit script completed.
=============================================================================
*/