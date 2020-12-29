# Use a minimal image as a parent image
FROM ubuntu:19.10
ARG NPM_BUILD_DIR

# Install dependencies.
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y iptables && \
    apt-get install -y ipset && \
    apt-get install -y iproute2

WORKDIR /usr/bin
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
COPY collect.sh /usr/bin/collect.sh
RUN chmod +x /usr/bin/collect.sh 
CMD [ "collect.sh" ]

