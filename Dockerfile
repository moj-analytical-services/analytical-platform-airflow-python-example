FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.9.0@sha256:e8d4a3f42941d5e6f85f0e71b6035dddc46ee52e3698e09eb52f4ed439d68d02

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
