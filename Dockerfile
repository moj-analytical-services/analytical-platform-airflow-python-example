FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.11.0@sha256:eb98063dd0a2703bbb71ca3507da48a5142de7c10f0cc5c458c51eec5e2fdde8

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
