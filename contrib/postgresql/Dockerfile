FROM postgis/postgis:11-3.3

# Customize default user/pass/db
ENV POSTGRES_DB=ckan_default
ENV POSTGRES_USER=ckan_default
ARG DATASTORE_READONLY_PASS

# Include datastore setup scripts
ADD ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
