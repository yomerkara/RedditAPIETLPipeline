FROM apache/airflow:2.7.1-python3.9

COPY requirements.txt /opt/airflow/

USER root
RUN apt-get update && apt-get install -y gcc python3-dev

USER airflow
ENV PYTHONDONTWRITEBYTECODE=1

RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt --user
RUN pip install --upgrade "apache-airflow-providers-openlineage>=1.8.0"
