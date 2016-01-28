FROM jenkins

# needed to be able to mount directories in cloud providers
USER root

COPY config/insecure_rsa /home/ubuntu/.ssh/insecure_rsa
COPY config/insecure_rsa.pub /home/ubuntu/.ssh/insecure_rsa.pub

RUN apt-get update
RUN apt-get install bzip2

RUN curl -sSL http://deis.io/deis-cli/install.sh | sh
RUN mv deis /usr/local/bin

COPY config/plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

COPY config/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

RUN mkdir /root/.ssh/
RUN echo "Host deis.xyz\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
RUN cat /root/.ssh/config
