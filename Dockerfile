FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg python3-venv -y

# Set up a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN cd /
RUN git clone https://github.com/Ernestservicee/Video-bot
WORKDIR /Video-bot
RUN pip install -U pip
RUN pip install -U -r requirements.txt

# Explicitly install latest pytgcalls
RUN pip install pytgcalls==3.0.0.dev21 

CMD ["python3", "main.py"]
