FROM openjdk:8

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone && \
    echo '    StrictHostKeyChecking  no' >> /etc/ssh/ssh_config

RUN apt-get update && \
     apt-get install --no-install-recommends -y \
     git \
     curl && \
    apt-get autoremove -y

# Install Docker Client
# RUN wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.1.tgz && \
#     gunzip -c docker.tgz | tar xvf - && \
#     mv docker/docker /usr/bin/docker && \
#     chmod +x /usr/bin/docker && \
#     rm -rf ./docker ./docker.tgz
RUN curl -s -L https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 > /usr/bin/docker; chmod +x /usr/bin/docker

# Install Sonar Scanner
ADD https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.0.0.1744-linux.zip /usr/local
ADD https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-2.8.zip /usr/local
RUN cd /usr/local/ && unzip sonar-scanner-2.8.zip && unzip sonar-scanner-cli-4.0.0.1744-linux.zip && rm *.zip


# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose


