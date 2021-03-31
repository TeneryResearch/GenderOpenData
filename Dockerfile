FROM cwradvocacy/ckan:2.9.2

WORKDIR /
ADD requirements.txt /requirements.txt

RUN pip install -q -r /requirements.txt && \
    pip install -q -r /src/ckanext-s3filestore/requirements.txt && \
    pip install -q -r /src/ckanext-harvest/pip-requirements.txt && \
    pip install -q -r /src/ckanext-dcat/requirements.txt

ADD ckan.ini /ckan.ini

# For Production
RUN pip install uwsgi
ADD Procfile /Procfile

EXPOSE 8080/tcp

CMD ["uwsgi", "-i", "/ckan-uwsgi.ini"]
