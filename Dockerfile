FROM jenkins:alpine
RUN /usr/local/bin/install-plugins.sh locale docker-workflow findbugs analysis-collector pipeline-utility-steps script-security 
