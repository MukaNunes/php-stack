# PHP-Stack Docker Environment

This repository provides a PHP development environment with support for multiple PHP versions, along with various services useful for web development, all configured to run in Docker containers.

### Included Versions and Tools:
- **PHP 5.6**: With pecl certificate fix (24-02-01)
- **PHP 7.2**
- **Composer**: PHP dependency manager.
- **Xdebug**: PHP debugging tool.
- **Redis**: Data caching store.
- **MySQL 5.6**: Relational database.

### Prerequisites:
- Docker
- Docker Compose

### Running the Environment

1. Clone the `php-stack` repository to your projects folder:

    ```bash
    git clone git@github.com:MukaNunes/php-stack.git ~/my-projects/php-stack
    ```

2. Navigate to the project directory:

    ```bash
    cd ~/my-projects/php-stack
    ```

3. Start the containers with Docker Compose:

    ```bash
    docker-compose up -d --build
    ```

   This command will build and start the containers in the background.

### Local DNS Configuration for Multi-PHP Versions

To make it easier to access different PHP containers (5.6 and 7.2), you can add custom entries to your `/etc/hosts` file. This will allow you to access these PHP versions through URLs like `php5.local` and `php7.local` in your browser.

Add the following line to your `/etc/hosts` file:

```bash
echo "127.0.0.1 php5.local php7.local" | sudo tee -a /etc/hosts
```

### Available Services

-   **localhost**: Nginx Web Server to serve PHP files.
-   **172.8.0.15:33063**: MySQL 5.6 - Accessible via port 33063.
-   **172.8.0.16:6379**: Redis - Accessible via port 6379.

### Accessing PHP Containers

With the environment configured and the containers running, you can access the different PHP versions via the URLs configured in the `/etc/hosts` file:

-   `http://php5.local` for PHP 5.6
-   `http://php7.local` for PHP 7.2

If you need to connect directly to a specific PHP container (e.g., to run Composer commands or access the container shell), use the following commands:

-   For the PHP 5.6 container:

```bash
docker exec -it php5-container-name bash
```

-   For the PHP 7.2 container:

```bash
docker exec -it php7-container-name bash
```

### Stopping and Cleaning Up the Environment

To stop the containers, you can run:

```bash
docker-compose down
```