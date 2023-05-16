SRC = srcs/docker-compose.yml
RM = rm -rf

all:
	docker-compose -f $(SRC) up --build -d

down:
	docker compose -f $(SRC) down

clean:
	docker system prune --all --force --volumes
	$(RM) /home/qjungo/inception/data/db/*
	$(RM) /home/qjungo/inception/data/files/*

ls:
	docker ps -a
	docker images ls

.PHONY: all down clean ls
