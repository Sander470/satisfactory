# Satisfactory server project

A project that:

- runs a satisfactory server
- at startup (still have to include the systemd service file with maybe an installscript)
- includes an api that you can control and check the state of the server with
- automatically gets/renews certificates

(anyway that was the ambition, I've pretty much ditched the project since tho lol)

## File Structure

    satisfactory/
    ├── certbot/
    │   ├── letsencrypt/
    │   │   └── live/
    │   ├── log/
    │   └── secrets/
    ├── nginx/
    │   ├── config/
    │   │   ├── nginx.conf
    │   │   └── conf.d/
    │   ├── log/
    │   └── site/
    ├── node/
    ├── server/
    │   └── saved/
    ├── docker-compose.yml
    └── cron_job-installer.sh

- certbot/letsencrypt/live/ contains the certificates.
- certbot/secrets/ requires a cloudflare.ini containing a dns_cloudflare_token and a .env containing the DOMAIN, WILDCARD_DOMAIN and EMAIL variables.
- nginx/config/ contains the nginx config and ./conf.d/ contains the website config
- nginx/site/ contains the files for the website.
- node/ contains the node.js api.
- server/ contains all the files and data for the satisfactory server.
- docker-compose.yml is the main file to run.
- cron_job-installer.sh enables/disables the cronjob for automatic certificate renewal through the certbot container.

## Required forwarded ports

- 80 (HTTP)
- 443 (HTTPS)
- 3000 (API)
- 7777 (Satisfactory Server)

## DNS Setup

- A / AAAA record *.[domain].tld -> {ip} (can be proxied)
- A / AAAA record satisfactory.[domain].tld -> {ip} (can NOT be proxied)
- (optional) CNAME www -> [domain].tld

## Note to self

When using Docker, to have containers talk to eachother they need to:

- Be on the same Docker Network
- Use eachothers' container names; NOT 127.0.0.1 or localhost or whatever.
