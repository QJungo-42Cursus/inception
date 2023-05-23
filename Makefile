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
	sudo $(RM) $(DATA)

ls:
	sudo docker ps -a

re: clean all

set_domain:
	(cat /etc/hosts | grep "qjungo.42.fr") || (echo "" | sudo tee -a /etc/hosts && echo "127.0.0.1 qjungo.42.fr" | sudo tee -a /etc/hosts)

.PHONY: all down clean re ls
