FROM python:3.9
ADD . /folder_3x03
WORKDIR /folder_3x03
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apt-get update -y

# selanium testing
RUN sbase install geckodriver
RUN export PATH=$PATH:/usr/local/lib/python3.9/site-packages/seleniumbase/drivers
RUN apt-get install firefox-esr -y

# owasp-dc
RUN apt-get install default-jdk -y 
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN export JAVA_HOME

## WARNINGS NEXT GEN PLUGIN


EXPOSE 5000

# CMD ["uwsgi", "--socket", "0.0.0.0:5000", "--protocol=http", "-w", "wsgi:app", "--logto", "/tmp/wsgi.log"]
CMD ["python3", "app.py"]