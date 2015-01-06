FROM rics3n/rails_base:4.2.0
MAINTAINER Rico Nuguid <rico@snib.it>

RUN apt-get update
RUN apt-get install -y python python-dev python-pip python-virtualenv ansible
RUN rm -rf /var/lib/apt/lists/*

RUN pip install dopy

RUN mkdir -p /app
WORKDIR /app

EXPOSE 3000

# Define default command.
CMD ["bash"]
