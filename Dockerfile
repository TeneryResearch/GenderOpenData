FROM cwradvocacy/ckan:2.9.2

EXPOSE 5000/tcp

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

CMD ["ckan", "-c", "/ckan.ini", "run", "--host", "0.0.0.0"]
