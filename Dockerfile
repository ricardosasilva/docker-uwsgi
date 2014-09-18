FROM salamandra/confd

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq python python-dev python-pip

# install uWSGI
RUN pip install uWSGI==2.0.7

RUN mkdir -p /opt/uwsgi/

ADD sample.py /opt/uwsgi/
ADD supervisor/conf.d/ /etc/supervisor/conf.d/

# Expose ports.
EXPOSE 40000
