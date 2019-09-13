FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install nodejs -y
RUN apt-get install curl -y
RUN apt-get install git -y
RUN apt-get install wget -y
RUN apt-get install npm -y
RUN npm install -g npm@6.9.0
RUN npm cache clean -f
RUN npm install -g n
RUN n 10.16.0
COPY . /home/server
WORKDIR /home/server
RUN npm install
CMD ["npm", "start"]
