build:
	docker-compose build

web:
	docker-compose up web
web-build:
	docker-compose build web
web-build-nc:
	docker-compose build --no-cache web
web-bash:
	docker-compose exec web bash


#  Container Commands
paster:
	docker-compose exec web paster --plugin=ckan
db-init:
	docker-compose exec web paster --plugin=ckan db init
db-upgrade:
	docker-compose exec web paster --plugin=ckan db upgrade
rebuild-index:
	docker-compose exec web paster --plugin=ckan search-index rebuild -r
issues-init:
	docker-compose exec web paster --plugin=ckanext-issues issues init_db


# CKAN  // TODO: --no-cache 
ckan:
	docker build --platform=linux/amd64 --build-arg CKAN_VERSION=${CKAN_VERSION} -t cwradvocacy/ckan:latest -t cwradvocacy/ckan:${CKAN_VERSION} contrib/ckan

ckan-publish:
	docker push cwradvocacy/ckan:latest
	docker push cwradvocacy/ckan:${CKAN_VERSION}

# DB
db:
	docker build --platform=linux/amd64 -t cwradvocacy/ckan-db:latest -t cwradvocacy/ckan-db:${CKAN_VERSION} contrib/postgresql

db-publish:
	docker push cwradvocacy/ckan-db:latest
	docker push cwradvocacy/ckan-db:${CKAN_VERSION}

# Solr
solr:
	docker build --platform=linux/amd64 --no-cache --build-arg CKAN_VERSION=${CKAN_VERSION} -t cwradvocacy/ckan-solr:latest -t cwradvocacy/ckan-solr:${CKAN_VERSION} contrib/solr

solr-publish:
	docker push cwradvocacy/ckan-solr:latest
	docker push cwradvocacy/ckan-solr:${CKAN_VERSION}

# DataPusher
datapusher:
	docker build --platform=linux/amd64 -t cwradvocacy/ckan-datapusher:latest -t cwradvocacy/ckan-datapusher:0.0.17 contrib/ckan-datapusher

datapusher-publish:
	docker push cwradvocacy/ckan-datapusher:latest
	docker push cwradvocacy/ckan-datapusher:0.0.17
