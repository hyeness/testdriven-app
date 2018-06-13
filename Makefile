all: up

up:
	@echo run docker-compose.
	docker-compose -f docker-compose-dev.yml up -d --no-deps --build
	sleep 1
	docker-compose -f docker-compose-dev.yml logs

down:
	@echo shut down docker-containers
	docker-compose -f docker-compose-dev.yml down


users:
	@echo ssh into your users container
	docker exec -it users bash

clean:
	find . -name '*.pyc' -delete
	find . -name '__pycache__' -type d | xargs rm -fr
	find . -name '*.egg-info'
	rm -fr docs/_build/
	sh clean.sh

dev_log:
	docker-compose -f docker-compose-dev.yml logs

reset:
	docker system prune
	docker system prune --all --force --volumes


.PHONY : docs clean