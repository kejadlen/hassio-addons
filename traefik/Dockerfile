ARG BUILD_FROM
FROM $BUILD_FROM

FROM traefik:v2.0

RUN apk update && apk upgrade && \
    apk add jq

COPY traefik.toml /etc/traefik/traefik.toml

COPY routers.jq /
COPY services.jq /

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
