FROM python:3.6

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL=C

# Issue: setuptools - https://github.com/pypa/setuptools/issues/2017
RUN pip install -U pip 'setuptools==45'

RUN pip install -e git+https://github.com/ckan/datapusher.git@0.0.17#egg=datapusher
RUN pip install -r /src/datapusher/requirements.txt \
    && pip install /src/datapusher/

# For Production
RUN pip install uwsgi


ENV JOB_CONFIG /src/datapusher/deployment/datapusher_settings.py

EXPOSE 8000

WORKDIR /src/datapusher

CMD ["python", "/src/datapusher/datapusher/main.py", "/src/datapusher/deployment/datapusher_settings.py"]
