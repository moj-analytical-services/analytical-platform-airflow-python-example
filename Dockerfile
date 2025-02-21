FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.6.0@sha256:7babcf64d296ba0a38648eefe3796b7e77a61cb6cd37226f7bb93ba3518addde

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
