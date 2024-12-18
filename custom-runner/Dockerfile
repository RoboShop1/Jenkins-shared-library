# Use an official Ubuntu image as the base
FROM ubuntu:20.04

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install dependencies
RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y \
    curl \
    git \
    sudo \
    jq \
    libcurl4-openssl-dev \
    libicu-dev \
    ca-certificates \
    libssl-dev \
    unzip \
    lsb-release \
    apt-transport-https

RUN curl -o actions-runner.tar.gz -L https://github.com/actions/runner/releases/download/v2.320.0/actions-runner-linux-x64-2.320.0.tar.gz && \
    mkdir /actions-runner && \
    tar xzf actions-runner.tar.gz -C /actions-runner && \
    rm actions-runner.tar.gz

# Set up environment variables
WORKDIR /actions-runner
RUN useradd -m  runner &&\
    chown -R runner:runner /actions-runner
# Copy your runner configuration script (optional, you can configure manually)
#COPY config.sh /actions-runner/config.s
USER runner
COPY runner.sh .
CMD ["bash","runner.sh"]