# Use a minimal image as a parent image
FROM alpine:3.7
ARG NPM_BUILD_DIR

# Install dependencies.
RUN apk add --no-cache mysql-client curl && \
    apk add --no-cache mysql-client iptables && \
    apk add --no-cache mysql-client ipset && \
    apk add --no-cache mysql-client iproute2

WORKDIR /usr/bin
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
COPY collect.sh /usr/bin/collect.sh
RUN chmod +x /usr/bin/collect.sh 
CMD [ "collect.sh" ]

