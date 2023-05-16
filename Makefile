SRC = srcs/docker-compose.yml
RM = rm -rf
NETWORK = inception-network

all:
	docker-compose -f $(SRC) up --build -d

down:
	# docker network rm $(NETWORK)
	docker compose -f $(SRC) down

clean:
	docker system prune --all --force --volumes
	$(RM) /home/qjungo/inception/data/db/*
	$(RM) /home/qjungo/inception/data/files/*

ls:
	docker ps -a
	docker images ls

re: down clean all

.PHONY: all down clean re ls
