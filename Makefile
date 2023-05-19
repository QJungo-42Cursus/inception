SRC = srcs/docker-compose.yml
RM = rm -rf
NETWORK = inception-network
DATA = /var/inception/

all:
	mkdir -p $(DATA)/db
	mkdir -p $(DATA)/files
	docker-compose -f $(SRC) up --build -d

down:
	# docker network rm $(NETWORK)
	docker compose -f $(SRC) down

clean:
	docker system prune --all --force --volumes
	$(RM) $(DATA)/db/*
	$(RM) $(DATA)/files/*

ls:
	docker ps -a

re: down clean all

.PHONY: all down clean re ls
