FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.18.0@sha256:ad47108ca5ad7a1dd616485c972259e78aa8bca9984293d4ef96b5366e687c19

ARG MOJAP_IMAGE_VERSION="default"
ENV MOJAP_IMAGE_VERSION=${MOJAP_IMAGE_VERSION}

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
