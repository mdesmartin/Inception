# PATH_TO_DATA = /home/ebillon/data/

all:
	$(MAKE) up

up:
	# mkdir -p $(PATH_TO_DATA)wordpress
	# mkdir -p $(PATH_TO_DATA)mariadb
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down 

clean:
	docker compose -f srcs/docker-compose.yml down --rmi local -v

fclean:
	docker compose -f srcs/docker-compose.yml down --rmi all -v --remove-orphans
	# rm -rf $(PATH_TO_DATA)*
	

re: fclean
	$(MAKE) up


# docker compose up -d --build

# docker compose down -v
