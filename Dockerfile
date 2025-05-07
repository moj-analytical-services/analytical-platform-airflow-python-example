FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.12.0@sha256:f4e6b42430a08e3eeef7ae3b3429745f68827cff0c36b2e67e9b4e683696a9b7

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
