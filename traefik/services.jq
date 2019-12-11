.services[] |
"  [http.services.\(.name).loadBalancer]
    [[http.services.\(.name).loadBalancer.servers]]
      url = \"\(.url)\"
"
