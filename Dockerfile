FROM cwradvocacy/ckan:2.10.4 as base

WORKDIR /
ADD requirements.txt /requirements.txt

RUN pip install -r /requirements.txt && \
    pip install -r /src/ckanext-s3filestore/requirements.txt && \
    pip install -r /src/ckanext-dcat/requirements.txt && \
    pip install -r /src/ckanext-harvest/pip-requirements.txt

ADD ckan.ini /ckan.ini
ADD ./contrib/ckan/ckan-uwsgi.ini /ckan-uwsgi.ini
ADD ./contrib/ckan/ckan-wsgi.py /ckan-wsgi.py
ADD Procfile /Procfile

# genderopendata ckan extension
ADD ./ckanext-genderopendata /src/ckanext-genderopendata
RUN pip install -e /src/ckanext-genderopendata/

EXPOSE 8080/tcp

CMD ["uwsgi", "-i", "/ckan-uwsgi.ini"]


# dev
FROM base as dev
RUN pip install -r /src/ckan/dev-requirements.txt

RUN pip install -e /src/ckanext-s3filestore
RUN pip install -e /src/ckanext-sentry
RUN pip install -e /src/ckanext-genderopendata

# Set users
RUN chown -R www-data:www-data /src
