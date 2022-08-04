FROM quay.io/centos/centos:stream8

# Install ssh client and git
RUN yum install -y git

# Download public key for github.com
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

# Clone private repository
RUN --mount=type=ssh git clone git@github.com:mephmanx/pfsense-base-image.git

ENV TERM xterm-256color
ENV USERHOME=/root
USER 0
WORKDIR $USERHOME

ARG VERSION
ENV VERSION=$VERSION

ARG PFSENSE_VERSION
ENV PF_VER=${PFSENSE_VERSION}

COPY init-script.sh /root
RUN chmod +x /root/init-script.sh
RUN ./init-script.sh "$PF_VER"
CMD ["/bin/bash", "-l"]
