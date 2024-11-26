VERBOSE=--verbose

all: # do nothing by default
	@echo "usage: make [build-docker|run-dev|dev|stop|sh]"

build-docker: # build dev container
	# docker build -t hello-algo-dev -f Dockerfile-dev .
	docker compose -f docker-compose-dev.yml build

buildx-docker:
	docker build -t hello-algo-dev -f Dockerfile-dev . --load

run-dev: # run in background
	docker compose -f docker-compose-dev.yml up -d

dev: # run dev container
	docker compose -f docker-compose-dev.yml $(VERBOSE) up

stop: # stop dev container
	docker compose -f docker-compose-dev.yml down

sh: # go to dev container shell
	docker exec -it hello-algo-dev sh
