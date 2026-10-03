import pandas as pd
import random

# Fixed seed keeps data identical every time it runs
random.seed(42)

first_names = [
    "Aarav", "Ananya", "Rohan", "Priya", "Karthik", "Sneha", "Vikram", "Pooja", 
    "Rahul", "Divya", "Arjun", "Meera", "Sanjay", "Deepika", "Aditya", "Neha", 
    "Varun", "Anjali", "Suresh", "Lakshmi"
]
last_names = [
    "Kumar", "Sharma", "Patel", "Iyer", "Reddy", "Verma", "Nair", "Gupta", 
    "Singh", "Menon", "Joshi", "Das", "Rao", "Pillai", "Choudhury"
]

departments = ["Billing Support", "Technical Support", "Priority Escalations", "General Inquiries"]
shifts = ["Morning (08:00-16:00)", "Evening (16:00-00:00)", "Night (00:00-08:00)"]

agents = []
for agent_id in range(101, 151):  # Generates 50 Agents (IDs: 101 to 150)
    full_name = f"{random.choice(first_names)} {random.choice(last_names)}"
    agents.append({
        "Agent_ID": agent_id,
        "Agent_Name": full_name,
        "Department_Queue": random.choice(departments),
        "Shift_Type": random.choice(shifts),
        "Target_Handle_Time_Sec": random.choice([180, 240, 300, 360])
    })

df_agents = pd.DataFrame(agents)
df_agents.to_csv("data/dim_agents.csv", index=False)
print("SUCCESS: data/dim_agents.csv created with 50 agent records.")