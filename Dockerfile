FROM cwradvocacy/ckan:2.10.7 AS base

WORKDIR /
COPY requirements.txt /requirements.txt

RUN pip install -r /requirements.txt && \
    pip install -r /src/ckanext-s3filestore/requirements.txt && \
    pip install -r /src/ckanext-dcat/requirements.txt && \
    pip install -r /src/ckanext-harvest/pip-requirements.txt

COPY ckan.ini /ckan.ini
COPY ./contrib/ckan/ckan-uwsgi.ini /ckan-uwsgi.ini
COPY ./contrib/ckan/ckan-wsgi.py /ckan-wsgi.py
COPY Procfile /Procfile

# genderopendata ckan extension
COPY ./ckanext-genderopendata /src/ckanext-genderopendata
RUN pip install -e /src/ckanext-genderopendata/

EXPOSE 8080/tcp

CMD ["uwsgi", "-i", "/ckan-uwsgi.ini"]

# dev
FROM base AS dev

RUN pip install -r /src/ckan/dev-requirements.txt && \
    pip install -e /src/ckanext-s3filestore && \
    pip install -e /src/ckanext-sentry && \
    pip install -e /src/ckanext-genderopendata

# Set users
RUN chown -R www-data:www-data /src
