FROM cwradvocacy/ckan:2.9.3

WORKDIR /
ADD requirements.txt /requirements.txt

RUN pip install -q -r /requirements.txt && \
    pip install -q -r /src/ckanext-s3filestore/requirements.txt && \
    pip install -q -r /src/ckanext-dcat/requirements.txt && \
    pip install uwsgi

ADD ckan.ini /ckan.ini
ADD ./contrib/ckan/ckan-uwsgi.ini /ckan-uwsgi.ini
ADD ./contrib/ckan/ckan-wsgi.py /ckan-wsgi.py
ADD Procfile /Procfile

# GenderOpenData extension
ADD ./ckanext-genderopendata /src/ckanext-genderopendata
RUN cd /src/ckanext-genderopendata/ && python setup.py develop

EXPOSE 8080/tcp

CMD ["uwsgi", "-i", "/ckan-uwsgi.ini"]
