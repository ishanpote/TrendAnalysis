import pandas as pd
import sqlite3
import os

# Define relative path coordinates
csv_path = os.path.join('data', 'Online Sales Data.csv')
db_path = os.path.join('data', 'online_sales.db')

# 1. Load your uploaded CSV dataset
if not os.path.exists(csv_path):
    raise FileNotFoundError(f"Could not locate '{csv_path}'. Please ensure the CSV is placed inside the data/ folder.")

df = pd.read_csv(csv_path)

# 2. Clean and standardize column names for professional SQL identifiers
df.columns = df.columns.str.strip().str.replace(' ', '_').str.lower()
df.rename(columns={'date': 'order_date', 'total_revenue': 'amount'}, inplace=True)

# 3. Establish connection and write to SQLite database
conn = sqlite3.connect(db_path)
df.to_sql('orders', conn, if_exists='replace', index=False)

print("--- Data Import Success Log ---")
print(f"Successfully generated relational database at: '{db_path}'")
print(f"Loaded 'orders' table with {len(df)} standardized transaction rows.")
print(f"Available tracking identifiers: {list(df.columns)}")

conn.close()