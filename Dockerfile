FROM debian:latest



RUN apt update && apt upgrade -y

RUN apt install git curl python3-pip ffmpeg -y

RUN pip3 install -U pip

RUN cd /

RUN https://github.com/Ernestservicee/Video-bot

RUN cd Video-bot

WORKDIR /Video-bot

RUN pip3 install -U -r requirements.txt

CMD python3 main.py
