import snowflake.connector

conn = snowflake.connector.connect(
    user="Karyna",
    password="!KARi061192123",
    account = "MJRQZKO-VC35790",
    warehouse="first_wh",
    database="dbt_db",
    schema="first_schema",
    role="dbt_role",
    insecure_mode=True 
)

print(conn.cursor().execute("SELECT CURRENT_VERSION();").fetchone())