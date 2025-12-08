FROM python:3.14-slim-bookworm

## Update Image
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates

# install UV:  Download the latest installer
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh

# Ensure the installed binary is on the `PATH`
ENV PATH="/root/.local/bin/:$PATH"

WORKDIR  /app
COPY ./pyproject.toml /app
COPY ./.python-version /app
COPY ./src /app

RUN uv sync 

