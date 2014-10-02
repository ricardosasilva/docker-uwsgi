FROM salamandra/rsyslog

RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq python python-dev python-pip
RUN rm -rf /var/lib/apt/lists/*

# install uWSGI
RUN pip install uWSGI==2.0.7

ADD supervisor/conf.d/ /etc/supervisor/conf.d/

VOLUME ["/data/app/"]

# Expose ports.
EXPOSE 40000
