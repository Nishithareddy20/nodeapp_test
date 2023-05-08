FROM centos:7
WORKDIR /app
RUN yum update -y
RUN yum install -y wget
RUN    wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.gz
RUN    tar -xzf node-v14.17.0-linux-x64.tar.gz
RUN    rm node-v14.17.0-linux-x64.tar.gz
ENV PATH="/app/node-v14.17.0-linux-x64/bin:${PATH}"
EXPOSE 3000
COPY package*.json ./
COPY . .
RUN npm install
CMD ["npm", "start"]
