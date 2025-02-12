FROM python:3.11

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C

WORKDIR /

# issue: setuptools - https://github.com/pypa/setuptools/issues/2017
RUN pip install -U pip 'setuptools==45' \
    && pip install -e git+https://github.com/ckan/datapusher.git@0.0.19#egg=datapusher \
    && pip install -r /src/datapusher/requirements.txt \
    && pip install /src/datapusher/ \
    && pip install uwsgi
    
COPY ./datapusher-uwsgi.ini /datapusher-uwsgi.ini
COPY ./Procfile /Procfile

# for development
COPY ./datapusher_settings_dev.py /src/datapusher/deployment/datapusher_settings_dev.py

ENV JOB_CONFIG=/src/datapusher/deployment/datapusher_settings.py

EXPOSE 8800

CMD ["python", "/src/datapusher/datapusher/main.py", "/src/datapusher/deployment/datapusher_settings.py"]
