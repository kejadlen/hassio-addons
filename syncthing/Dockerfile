ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk update && apk upgrade && \
    apk add syncthing
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
