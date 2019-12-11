.routers[] |
"  [http.routers.\(.name)]
    entryPoints = [\"http\", \"https\"]
    rule = \"Host(`\(.host)`)\"
    # middlewares = [\"redirect-https\"]
    service = \"\(.service)\"
    [http.routers.\(.name).tls]
      certResolver = \"le\"
"
