
FROM python:3.6

ENV DEBIAN_FRONTEND noninteractive

ARG CKAN_VERSION=2.9.2

# Install Postgres Client
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends apt-utils postgresql-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Issue: setuptools - https://github.com/pypa/setuptools/issues/2017
RUN pip install -U -q pip 'setuptools==45'

RUN pip install -q -e "git+https://github.com/ckan/ckan.git@ckan-${CKAN_VERSION}#egg=ckan"
RUN pip install -q -r /src/ckan/requirements.txt

RUN pip install -q 'gunicorn[gevent]==20.1.0'

ADD ./ckan-entrypoint.sh /
RUN chmod +x /ckan-entrypoint.sh
ENTRYPOINT [ "/ckan-entrypoint.sh" ]

CMD [ "gunicorn", "--workers", "3", "--worker-class", "gevent", "--paste", "/src/ckan/ckan/config/deployment.ini_tmpl", "-t", "600" ]
