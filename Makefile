SRC = srcs/docker-compose.yml
RM = rm -rf
NETWORK = inception-network
DATA = /home/qjungo/data

all:
	mkdir -p $(DATA)/db $(DATA)/files
	sudo docker-compose -f $(SRC) up --build -d

down:
	sudo docker compose -f $(SRC) down

clean: down
	sudo docker system prune --all --force --volumes
	sudo docker volume rm db files || true
	sudo $(RM) $(DATA)/db/* $(DATA)/files/*

ls:
	sudo docker ps -a

re: clean all

.PHONY: all down clean re ls
