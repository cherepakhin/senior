curl -k -X PUT -H "Content-Type: application/json" \
  --data '{
    "password": "pass",
    "opendistro_security_roles": ["read_only"]
  }' "https://127.0.0.1:9200/_plugins/_security/api/internalusers/vasi"
