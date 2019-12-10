ARG BUILD_FROM
FROM $BUILD_FROM

FROM traefik:v2.0

COPY traefik.toml /etc/traefik.toml

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
