
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

ADD ./ckan-entrypoint.sh /
RUN chmod +x /ckan-entrypoint.sh
ENTRYPOINT [ "/ckan-entrypoint.sh" ]

CMD ["ckan", "-c", "/ckan.ini", "run", "--host", "0.0.0.0"]
