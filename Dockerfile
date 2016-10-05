FROM jenkins:alpine
RUN /usr/local/bin/install-plugins.sh locale docker-workflow findbugs analysis-collector pipeline-utility-steps script-security 

USER root
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
RUN mv cf /usr/local/bin
RUN cf --version
USER jenkins

USER root
RUN apk add docker -U
#Hack for access to /var/run/docker.sock on jenkins user
RUN addgroup -g 998 docker2
RUN addgroup jenkins docker2
USER jenkins
