FROM quay.io/centos/centos:stream8

ENV TERM xterm-256color
ENV USERHOME=/root
USER 0
WORKDIR $USERHOME

ARG PFSENSE_VERSION
ENV PF_VER=${PFSENSE_VERSION}

COPY init-script.sh /root
RUN chmod +x /root/init-script.sh
RUN ./init-script.sh "$PF_VER"
CMD ["/bin/bash", "-l"]
