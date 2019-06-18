# Jenkins with pre-installed Docker, and possibility of stop jenkins without stop container
# Launch command :
# docker run --name jenkins -ti -p 8080:8080 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins_with_docker
FROM jenkins/jenkins:lts
COPY init.sh /home/scripts/

USER root

RUN apt update && \
    apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

RUN apt update && \
    apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io && \
    usermod -aG docker jenkins

WORKDIR /home/scripts/

ENTRYPOINT ["bash", "init.sh"]
