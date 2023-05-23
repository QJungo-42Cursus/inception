SRC = srcs/docker-compose.yml
RM = rm -rf
NETWORK = inception-network
DATA = /var/inception

all:
	mkdir -p $(DATA)/db
	mkdir -p $(DATA)/files
	sudo docker-compose -f $(SRC) up --build -d

down:
	# docker network rm $(NETWORK)
	sudo docker compose -f $(SRC) down

clean: down
	sudo docker system prune --all --force --volumes
	$(RM) $(DATA)/db/*
	$(RM) $(DATA)/files/*

ls:
	sudo docker ps -a

re: clean all

.PHONY: all down clean re ls
