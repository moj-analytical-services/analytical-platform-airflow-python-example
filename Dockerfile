FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.15.0@sha256:9802aede594062995aca0daeb9c6c159eea742fbc6602233739eccbb14b1ed17

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
