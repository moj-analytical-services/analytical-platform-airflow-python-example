FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.14.0@sha256:e6b0859e770b45e3ce13656ca39a24cb60db8237bb0638c34c35a26eaf59ee83

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
