#!/bin/bash

# Ensure required variables are set
if [[ -z "$DOMAIN" || -z "$WILDCARD_DOMAIN" || -z "$EMAIL" || ! -f /cloudflare.ini ]]; then
    echo "Missing required variables or cloudflare.ini file."
    exit 1
fi

# Run Certbot to request certificates (or renew them)
certbot certonly --dns-cloudflare --dns-cloudflare-credentials /cloudflare.ini \
    -d "$DOMAIN" -d "$WILDCARD_DOMAIN" -m "$EMAIL" \
    --agree-tos --non-interactive --test-cert

# Check if Certbot was successful
if [ $? -eq 0 ]; then
    echo "Certificates obtained successfully."
else
    echo "Certificate request failed."
fi
