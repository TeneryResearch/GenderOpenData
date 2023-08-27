FROM python:3.9

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL=C

WORKDIR /

# issue: setuptools - https://github.com/pypa/setuptools/issues/2017
RUN pip install -U pip 'setuptools==45'

RUN pip install -e git+https://github.com/ckan/datapusher.git@0.0.19#egg=datapusher
RUN pip install -r /src/datapusher/requirements.txt \
    && pip install /src/datapusher/

# for production
RUN pip install uwsgi
ADD ./datapusher-uwsgi.ini /datapusher-uwsgi.ini
ADD ./Procfile /Procfile

# for development
ADD ./datapusher_settings_dev.py /src/datapusher/deployment/datapusher_settings_dev.py

ENV JOB_CONFIG /src/datapusher/deployment/datapusher_settings.py

EXPOSE 8800

CMD ["python", "/src/datapusher/datapusher/main.py", "/src/datapusher/deployment/datapusher_settings.py"]
