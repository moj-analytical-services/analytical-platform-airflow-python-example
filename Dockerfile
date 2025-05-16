FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.13.0@sha256:a6dbd8483f4a75b0c328fe16602a8eaceea7c232c4c54349bfc697a2749f3b9a

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
