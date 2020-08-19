FROM ubuntu:18.04

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get -qq update
RUN apt-get -qq install -y epel-release update upgrade \
  wget curl git unzip zip \
  python3-distutils python3 python3-pip
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install nodejs -y
RUN git clone https://github.com/cddc22/her.git && cd her
RUN npm install --unsafe-perm=true --allow-root
RUN npm config set unsafe-perm=true
RUN npm install -g node-gyp 
RUN npm config set python $(which python2.7)
RUN npm i
RUN npm i pm2 -g && pm2 l
RUN chmod +x start.sh
CMD ["bash","start.sh"]
