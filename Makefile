#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo --------------------------
	@echo start / stop / restart
	@echo token
	@echo workspace / workspace-root
	@echo clean
	@echo --------------------------

_urls: _header
	${info }
	@echo Sitios disponibles:
	@echo -------------------------------------------------
	@echo [Jupyter] https://jupyter.test
	@echo [Traefik] https://traefik.jupyter.test/dashboard/
	@echo -------------------------------------------------

_header:
	@echo ----
	@echo Jupyter en Docker
	@echo ----

_start-command:
	@docker compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker compose stop

restart: stop start

token:
	@docker compose exec jupyter jupyter server list --json | docker run -i --rm ghcr.io/jqlang/jq -r '.token'

workspace:
	@docker compose exec jupyter /bin/bash

workspace-root:
	@docker compose exec --user root jupyter /bin/bash

clean:
	@docker compose down -v --remove-orphans
