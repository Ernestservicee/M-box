# Use a base image
FROM debian:latest

# Update the system and install necessary packages
RUN apt update && apt upgrade -y
RUN apt install -y git curl python3-pip ffmpeg python3-venv

# Set up a virtual environment to avoid issues with system-managed Python
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip and setuptools to avoid compatibility issues
RUN pip install --upgrade pip setuptools

# Install additional dependencies first to avoid errors
RUN pip install Pyrogram ffmpeg-python

# Install pytgcalls directly from GitHub to avoid the dependency issue
RUN pip install git+https://github.com/MarshalX/tgcalls.git@dev

# Clone the repository
RUN cd / && git clone https://github.com/Ernestservicee/Video-bot
WORKDIR /Video-bot

# Install other dependencies from requirements.txt, if there are any
RUN pip install -r requirements.txt || true

# Set the command to run the application
CMD ["python3", "main.py"]
