FROM cwradvocacy/ckan:2.9.7 as base

WORKDIR /
ADD requirements.txt /requirements.txt

RUN pip install uwsgi

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
RUN pip install flask-debugtoolbar
