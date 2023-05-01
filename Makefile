CKAN_VERSION=2.10.0
BASE_VERSION=${CKAN_VERSION}

build:
	docker compose build

web:
	docker compose up web
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
	docker build --platform=linux/amd64 --build-arg CKAN_VERSION=${CKAN_VERSION} -t cwradvocacy/ckan:latest -t cwradvocacy/ckan:${BASE_VERSION} contrib/ckan

ckan-publish:
	docker push cwradvocacy/ckan:latest
	docker push cwradvocacy/ckan:${BASE_VERSION}

# db
db:
	docker build --platform=linux/amd64 -t cwradvocacy/ckan-db:latest -t cwradvocacy/ckan-db:${BASE_VERSION} contrib/postgresql

db-publish:
	docker push cwradvocacy/ckan-db:latest
	docker push cwradvocacy/ckan-db:${BASE_VERSION}

# datapusher
datapusher-build:
	docker build --platform=linux/amd64 -t cwradvocacy/ckan-datapusher:latest -t cwradvocacy/ckan-datapusher:${BASE_VERSION} contrib/ckan-datapusher

datapusher-publish:
	docker push cwradvocacy/ckan-datapusher:latest
	docker push cwradvocacy/ckan-datapusher:${BASE_VERSION}
