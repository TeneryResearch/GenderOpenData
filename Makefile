CKAN_VERSION=2.10.9
BASE_VERSION=${CKAN_VERSION}

build:
	docker compose build

web:
	docker compose up web -d
web-build:
	docker compose build web
web-build-nc:
	docker compose build --no-cache web
web-bash:
	docker compose exec web bash
datapusher:
	docker compose up datapusher


# container commands
paster:
	docker compose exec web paster --plugin=ckan
db-init:
	docker compose exec web paster --plugin=ckan db init
db-upgrade:
	docker compose exec web paster --plugin=ckan db upgrade
rebuild-index:
	docker compose exec web paster --plugin=ckan search-index rebuild -r
issues-init:
	docker compose exec web paster --plugin=ckanext-issues issues init_db


# ckan
ckan:
	podman build --platform=linux/amd64 --build-arg CKAN_VERSION=${CKAN_VERSION} -t cwradvocacy/ckan:latest -t cwradvocacy/ckan:${BASE_VERSION} contrib/ckan

ckan-publish:
	podman push cwradvocacy/ckan:latest
	podman push cwradvocacy/ckan:${BASE_VERSION}

# db
db:
	podman build --platform=linux/amd64 -t cwradvocacy/ckan-db:latest -t cwradvocacy/ckan-db:${BASE_VERSION} contrib/postgresql

db-publish:
	podman push cwradvocacy/ckan-db:latest
	podman push cwradvocacy/ckan-db:${BASE_VERSION}

# datapusher
datapusher-build:
	podman build --platform=linux/amd64 -t cwradvocacy/ckan-datapusher:latest -t cwradvocacy/ckan-datapusher:${BASE_VERSION} contrib/ckan-datapusher

datapusher-publish:
	podman push cwradvocacy/ckan-datapusher:latest
	podman push cwradvocacy/ckan-datapusher:${BASE_VERSION}


# all
all:
	make ckan
	make db
	make datapusher-build

publish:
	make ckan-publish
	make db-publish
	make datapusher-publish

all-publish:
	make all
	make publish
