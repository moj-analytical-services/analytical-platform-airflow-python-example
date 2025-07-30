FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.17.0@sha256:1d1574e2485cca22b9d245583b1655833f7aa94f170b72ca2f97bf10e74c6318

ARG MOJAP_IMAGE_VERSION="default"
ENV MOJAP_IMAGE_VERSION=${MOJAP_IMAGE_VERSION}

COPY requirements.txt requirements.txt
COPY src/ .
RUN <<EOF
pip install --no-cache-dir --requirement requirements.txt
EOF

ENTRYPOINT ["bash", "entrypoint.sh"]
