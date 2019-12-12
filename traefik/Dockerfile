ARG BUILD_FROM

FROM traefik:v2.0

FROM $BUILD_FROM

COPY --from=0 /usr/local/bin/traefik .

COPY traefik.toml /etc/traefik/traefik.toml

COPY routers.jq /
COPY services.jq /

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
