ARG ecrRepo
FROM $ecrRepo/python:3.9-slim

ARG MAX_INCOMPLETE_EVENT_SIZE
ENV MAX_INCOMPLETE_EVENT_SIZE {$MAX_INCOMPLETE_EVENT_SIZE}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /code
RUN mkdir -p /var/log/credgenics_logs/

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts

ADD ssh_prv_key /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# Create app directory
WORKDIR /code
COPY requirements/requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
# Bundle app source
COPY ./ /code
RUN chmod 755 -R /code
RUN chmod 777 -R /code/
RUN chmod 777 -R /var/log/credgenics_logs/
EXPOSE 8000

CMD uvicorn app.server:app --host 0.0.0.0 --port 8000 --no-access-log --h11-max-incomplete-event-size ${MAX_INCOMPLETE_EVENT_SIZE: 51200}