FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.6.0-rc1

COPY requirements.txt requirements.txt
COPY src/main.py main.py
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["python3", "main.py"]
