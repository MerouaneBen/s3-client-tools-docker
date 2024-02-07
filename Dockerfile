FROM alpine:latest

# Install Python and pip
RUN apk update && apk add --no-cache \
    python3 \
    py3-pip \
    groff \
    less \
    mailcap \
    minio-client \
    findutils \
    bash

# Install AWS CLI without upgrading system pip
RUN pip3 install awscli --ignore-installed

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]
