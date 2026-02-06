FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.25.0@sha256:da527a4db1ce28e91857b6308c52d20b8d5897973cd065545d95f6fb2d4ad120

ARG MOJAP_IMAGE_VERSION="default"
ENV MOJAP_IMAGE_VERSION=${MOJAP_IMAGE_VERSION}

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
