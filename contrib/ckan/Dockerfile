FROM python:3.10

ENV DEBIAN_FRONTEND noninteractive

ARG CKAN_VERSION=2.10.4

# Install Postgres Client
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends apt-utils postgresql-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Default Postgres auth
ENV PGHOST db
ENV PGUSER ckan_default
ENV PGPASSWORD pass

# Issue: setuptools - https://github.com/pypa/setuptools/issues/2017
RUN pip install -U pip 'setuptools==45'

RUN pip install -e "git+https://github.com/ckan/ckan.git@ckan-${CKAN_VERSION}#egg=ckan"
RUN pip install -r /src/ckan/requirements.txt


ADD ./ckan-entrypoint.sh /
RUN chmod +x /ckan-entrypoint.sh
ENTRYPOINT [ "/ckan-entrypoint.sh" ]

EXPOSE 5000/tcp

CMD ["ckan", "-c", "/ckan.ini", "run", "--host", "0.0.0.0"]
