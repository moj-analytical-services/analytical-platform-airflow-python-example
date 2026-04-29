FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.28.0@sha256:dbc0edb7255177e9f446ad516239514a60b349a8

ARG MOJAP_IMAGE_VERSION="default"
ENV MOJAP_IMAGE_VERSION=${MOJAP_IMAGE_VERSION}

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
