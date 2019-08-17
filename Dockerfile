# Use a minimal image as a parent image
FROM ubuntu:19.10
ARG NPM_BUILD_DIR

# Install dependencies.
RUN apt-get update
RUN apt-get install -y iptables
RUN apt-get install -y ipset
WORKDIR /usr/bin
COPY test.sh /usr/bin/test.sh
RUN chmod +x /usr/bin/test.sh 
CMD [ "test.sh" ]

