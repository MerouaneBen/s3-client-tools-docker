FROM frolvlad/alpine-glibc:alpine-3.12

# Install necessary packages
RUN apk --no-cache add \
    curl \
    zip \
    groff \
    less \
    mailcap \
    bash

# Install MinIO Client
RUN curl -O https://dl.min.io/client/mc/release/linux-amd64/mc && \
    chmod +x mc && \
    mv mc /usr/local/bin/

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -f awscliv2.zip && \
    rm -rf aws

# Verify installations
RUN mc --version
RUN aws --version

# Set the entrypoint to bash
ENTRYPOINT ["/bin/bash"]
