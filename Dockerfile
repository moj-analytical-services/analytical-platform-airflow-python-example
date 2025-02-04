FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.5.0

COPY requirement.txt requirement.txt
COPY src/main.py main.py
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["python3", "main.py"]
