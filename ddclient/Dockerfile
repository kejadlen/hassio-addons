# FROM armhf/alpine
ARG BUILD_FROM
FROM $BUILD_FROM

# https://wiki.alpinelinux.org/wiki/Ddclient

RUN apk update && apk upgrade && \
    apk add \
        curl \
        make \
        perl \
        perl-io-socket-ssl \
        perl-utils
RUN cpan install Test::Requires && cpan Data::Validate::IP

RUN cd tmp && \
    curl --location https://github.com/ddclient/ddclient/archive/v3.9.0.tar.gz > ddclient-3.9.0.tar.gz && \
    tar xvz < ddclient-3.9.0.tar.gz && \
    cp ddclient-3.9.0/ddclient /usr/sbin && \
    mkdir /etc/ddclient && \
    mkdir -p /var/cache/ddclient

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
