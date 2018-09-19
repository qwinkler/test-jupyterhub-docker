FROM jupyterhub/jupyterhub:latest

RUN apt-get update && apt-get -y upgrade

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade setuptools

RUN npm install -g configurable-http-proxy
RUN python3 -m pip install notebook dockerspawner netifaces tornado
RUN apt-get update && apt-get upgrade
RUN python3 -m pip install --upgrade notebook dockerspawner netifaces tornado jupyterhub

ADD users /tmp/users
ADD add_user.sh /tmp/add_user.sh
RUN bash /tmp/add_user.sh /tmp/users

CMD jupyterhub -f jupyterhub_config.py --no-db
