FROM python:3.9-slim-buster
RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        build-essential \
        gcc \
        git \
        libpq-dev \
        python3-pip \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /app
WORKDIR /app
RUN pip3 install django
COPY hello.sh hello.sh
COPY . .
RUN chmod +x hello.sh
EXPOSE 8000
ENTRYPOINT ["/app/hello.sh"]
