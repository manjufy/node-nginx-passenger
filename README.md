# Passenger + Nginx + NodeJs - _Work In Progress_

## Build Image

```
docker image build -t phusion/passenger-nodejs:latest .
```

## Run Container

```
docker run -it phusion/passenger-nodejs:latest
```

## Docker Cheatsheet

```
docker system prune
docker images -a // LIST
docker rm $(docker ps -a -f status=exited -q) // Remove a container upon exit
docker system prune
```