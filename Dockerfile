# We're using Debian Slim Buster image
FROM arata74/saitama:latest

# Pypi package Repo upgrade
RUN pip3 install --upgrade pip setuptools

# Copy Python Requirements to /root/SaitamaRobot
RUN git clone https://github.com/anime-republic/SaitamaRobot /root/SaitamaRobot
WORKDIR /root/SaitamaRobot

#Copy config file to /root/SaitamaRobot/SaitamaRobot
COPY ./SaitamaRobot/sample_config.py ./SaitamaRobot/config.py* /root/SaitamaRobot/SaitamaRobot/

ENV PATH="/home/bot/bin:$PATH"

# Install requirements
RUN pip3 install -U -r requirements.txt

# Starting Worker
CMD ["python3","-m","SaitamaRobot"]
