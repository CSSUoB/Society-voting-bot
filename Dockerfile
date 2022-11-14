FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY ./src .

RUN groupadd -r votingbot && useradd --no-log-init -r -g votingbot votingbot
USER votingbot

CMD [ "python3", "main.py" ]

