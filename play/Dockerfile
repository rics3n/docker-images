FROM ubuntu:14.04
MAINTAINER Rico Nuguid <rico@snib.it>

ENV JAVA_VERSION 8
ENV ACTIVATOR_VERSION 1.2.12

#install jdk8
RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties unzip
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | \
  sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  sudo debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#install activator
RUN wget --no-check-certificate http://downloads.typesafe.com/typesafe-activator/$ACTIVATOR_VERSION/typesafe-activator-$ACTIVATOR_VERSION.zip
RUN unzip typesafe-activator-$ACTIVATOR_VERSION.zip
RUN rm -f typesafe-activator-$ACTIVATOR_VERSION.zip
RUN mv /activator-$ACTIVATOR_VERSION /opt/activator
RUN ln -s /opt/activator/activator /bin/activator

EXPOSE 8888 9000
CMD ["/bin/bash"]
