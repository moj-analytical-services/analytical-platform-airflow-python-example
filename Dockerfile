FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.7.0

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
