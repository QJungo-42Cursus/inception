SRC = srcs/docker-compose.yml

all:
	docker-compose -f $(SRC) up --build -d

down:
	docker compose -f $(SRC) down

clean:
	docker system prune --all --force --volumes

.PHONY: all down clean
