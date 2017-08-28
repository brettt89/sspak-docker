FROM php:5-cli

RUN apt-get update && apt-get install -y mysql-client
RUN docker-php-ext-install -j$(nproc) mysqli

RUN curl -sS https://silverstripe.github.io/sspak/install | php -- /usr/local/bin

VOLUME ["/app"]
WORKDIR /app

CMD ["-"]
ENTRYPOINT ["/usr/local/bin/sspak"]
