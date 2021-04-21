## Build image
cd an image derectory top level

It needs `ruby2.7.3` and `mysql8`

```sh
docker-compose up -d --build
docker-compose run web rails db:create
docker-compose run web rails db:migrate
```

## Start iamge
cd an image derectory top level

```sh
docker-compose up
```

or

```sh
docker-compose up -d
```

## Stop image
cd an image derectory top level

ctrl + c

or

```sh
docker-compose stop
```