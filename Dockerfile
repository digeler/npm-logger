# Use a minimal image as a parent image
FROM ubuntu:19.10
ARG NPM_BUILD_DIR

# Install dependencies.
RUN apt-get update && apt-get install curl -y 
RUN apt-get install -y iptables
RUN apt-get install -y ipset
WORKDIR /usr/bin
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
COPY test.sh /usr/bin/test.sh
RUN chmod +x /usr/bin/test.sh 
CMD [ "test.sh" ]

