FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.10.1@sha256:24f55afb965362ca37a5dc23f27fef8c46925061f1665abd507abafb6fd2ab78

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
