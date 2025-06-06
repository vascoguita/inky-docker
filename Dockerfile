ARG BASE_IMAGE

FROM ${BASE_IMAGE}

WORKDIR /inky

COPY requirements.txt .

RUN apt update && \
    apt install -y --no-install-recommends python3-pip libopenblas0 libopenjp2-7 && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --only-binary=:all: -r requirements.txt

CMD ["python"]
