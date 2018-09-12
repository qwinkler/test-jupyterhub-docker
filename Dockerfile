FROM jupyterhub/jupyterhub:latest

RUN pip3 install dockerspawner netifaces notebook
RUN apt-get update
RUN apt-get -y upgrade

ADD users /tmp/users
ADD add_user.sh /tmp/add_user.sh
RUN bash /tmp/add_user.sh /tmp/users

CMD jupyterhub -f jupyterhub_config.py --no-db
