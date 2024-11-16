# Satisfactory server with NGINX website (automated certbot SSL), API

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


## Required forwarded ports

- 80 (HTTP)
- 443 (HTTPS)
- 3000 (API)
- 7777 (Satisfactory Server)


## DNS Setup

- A / AAAA record jjgrootjans.com -> {ip} (can be proxied)
- A / AAAA record satisfactory.jjgrootjans.com -> {ip} (can NOT be proxied)
- (optional) CNAME www -> jjgrootjans.com
