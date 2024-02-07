FROM alpine:latest

# Install dependencies
RUN apk update && apk add --no-cache \
    groff \
    less \
    mailcap \
    minio-client \
    findutils \
    curl \
    bash

# Download and install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -f awscliv2.zip \
    && rm -rf aws

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]
