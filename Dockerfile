FROM quay.io/astronomer/astro-runtime:12.7.1

# Set working directory inside the container
WORKDIR /usr/local/airflow

# Create and install dbt in the virtual environment
RUN python -m venv /usr/local/airflow/dbt_venv && \
    /bin/bash -c "source /usr/local/airflow/dbt_venv/bin/activate && pip install --no-cache-dir dbt-snowflake"

# Ensure the virtual environment is included in the PATH
ENV PATH="/usr/local/airflow/dbt_venv/bin:$PATH"

# Verify dbt installation
RUN /usr/local/airflow/dbt_venv/bin/dbt --version