FROM alpine:latest

# Install Python and pip
RUN apk update && apk add --no-cache \
    python3 \
    py3-pip \
    groff \
    less \
    mailcap \
    minio-client \
    findutils

# Upgrade pip and install AWS CLI
RUN pip3 install --upgrade pip && \
    pip3 install awscli

# Set the entrypoint
ENTRYPOINT ["/bin/sh"]
