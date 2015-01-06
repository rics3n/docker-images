FROM dockerfile/ubuntu
MAINTAINER Rico Nuguid <rico@snib.it>

# Use bash, no dash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN adduser --disabled-password --gecos '' rails
RUN adduser rails sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# turn on universe packages
#RUN echo "deb http://archive.ubuntu.com/ubuntu raring main universe" > /etc/apt/sources.list
#RUN apt-get update

RUN apt-get update && apt-get install -y curl git procps build-essential libssl-dev libreadline-dev libxslt1-dev libxml2-dev libmagickwand-dev imagemagick g++ g++-4.8 make gnupg2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.0

ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/rvm/rubies/ruby-$RUBY_VERSION/bin

# install RVM, Ruby, and Bundler
RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -L https://get.rvm.io | bash -s stable
RUN source /usr/local/rvm/scripts/rvm
RUN rvm requirements
RUN rvm install $RUBY_VERSION
RUN source /usr/local/rvm/scripts/rvm && rvm use $RUBY_VERSION
RUN echo "source /usr/local/rvm/scripts/rvm" >> /etc/profile
RUN echo "rvm use $RUBY_VERSION --default --install" >> /etc/profile
RUN rvm use $RUBY_VERSION --default --install

RUN gem install bundler --no-ri --no-rdoc
RUN bundle config --global path "$GEM_HOME"
RUN bundle config --global bin "$GEM_HOME/bin"

ENV RAILS_VERSION 4.2.0
RUN gem install rails --version $RAILS_VERSION  --no-ri --no-rdoc

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y postgresql-client libpq-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
