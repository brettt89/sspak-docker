# SilverStripe SSPAK for Docker

This image is designed to be used with SilverStripe development environments. It allows SSPAK 
commands to be run using a container service.

## Maintainer Contact

 * Brett Tasker <brett.tasker@gmail.com>

## Requirements

 * [Docker](https://docs.docker.com/engine/installation/)

## How to use

### With a `docker-compose.yml`

```yml
  sspak:
    image: brettt89/silverstripe-docker
    links:
      - database:database
    volumes:
      - './snapshots:/app/snapshots:ro'
      - './_ss_environment.php:/app/_ss_environment.php:ro'
      - './public:/app/public:ro'
```

Then you can run

```bash
docker-compose run sspak <command>

# E.g.
docker-compose run sspak load snapshots/my-website.sspak public/
```

##### Links

A link to the database is required so SSPAK can load / save details from the 
database.

##### Volumes

In the example above, we have 3 mounted volumes. 

The first is the directory containing the snapshots on your host. E.g. `./snapshots/`
The second is a mount for the _ss_environment.php file for your website.
The third is the directory containing your website codebase.
