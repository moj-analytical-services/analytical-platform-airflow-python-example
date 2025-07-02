FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.16.0@sha256:96551185eef8ff5f54f82b6a55c5df570a795d155851cde1811f230423efca1b

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
