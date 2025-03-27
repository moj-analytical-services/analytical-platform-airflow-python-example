FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.9.0-rc2@sha256:71f0e2a5cf5a8e15139addfc5076ce9c80fa6a997af841a663625bf039c9287d

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
