FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.10.0@sha256:435e10620395b9b249bd84ae776bc43be17c819a3df1123016b9ea70da05f3d2

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
