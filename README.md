# Satisfactory server with NGINX website (automated certbot SSL), API

## File Structure

``satisfactory/
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
└── cron_job-installer.sh``
