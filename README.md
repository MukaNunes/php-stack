PHP-Stack Docker Environment
===============

### PHP development environment
- php5.6
- php7.2
- composer
- xdebug
- redis
- mysql 5.6
- Pecl Certificate fix (24-02-01)

### Running
Just clone the php-stack project into your projects folder and run:

```bash
docker compose up -d --build
```

### Services:
- **localhost**: Nginx WebServer
- **172.8.0.15:33063**: MySQL
- **172.8.0.16:6379**: Redis
