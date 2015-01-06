FROM dockerfile/nodejs
MAINTAINER Rico Nuguid <rico@snib.it>

RUN apt-get update
RUN apt-get install -y ansible

RUN pip install dopy

# Install Yeoman, Bower & Gulp
RUN npm install -g bower gulp yo

# Define working directory.
RUN mkdir /app
WORKDIR /app

#Expose the port where the dev server will be available
EXPOSE 9000

# Define default command.
CMD ["/bin/bash"]
