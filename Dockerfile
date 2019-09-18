FROM openjdk:8

RUN echo '    StrictHostKeyChecking  no' >> /etc/ssh/ssh_config

RUN apt-get update && \
     apt-get install --no-install-recommends -y \
     git \
     curl && \
    apt-get autoremove -y

# Install Docker Client
RUN wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.1.tgz && \
    gunzip -c docker.tgz | tar xvf - && \
    mv docker/docker /usr/bin/docker && \
    chmod +x /usr/bin/docker && \
    rm -rf ./docker ./docker.tgz

# Install Sonar Scanner
ADD http://of9tskapv.bkt.clouddn.com/sonar-scanner-2.8.zip /usr/local
ADD http://of9tskapv.bkt.clouddn.com/sonar-scanner-cli-3.0.3.778-linux.zip /usr/local
RUN cd /usr/local/ && unzip sonar-scanner-2.8.zip && unzip sonar-scanner-cli-3.0.3.778-linux.zip && rm *.zip


# Install Docker Compose
RUN curl -L "http://of9tskapv.bkt.clouddn.com/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
