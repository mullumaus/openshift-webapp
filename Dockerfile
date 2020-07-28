FROM ubuntu

RUN apt-get update
RUN apt-get install -y python python-setuptools python-dev build-essential python3-pip
RUN apt-get install -y mysql-server mysql-client
RUN service mysql start
  
RUN pip3 install flask
RUN pip3 install flask-mysql

COPY mysql.config /tmp/config
COPY app.py /opt/app.py


ENTRYPOINT bash /tmp/config;FLASK_APP=/opt/app.py flask run --host=0.0.0.0

#docker run -p 5000:5000  my-simple-web