FROM dockerfile/ubuntu
MAINTAINER Rico Nuguid <rico@snib.it>

# turn on universe packages
#RUN echo "deb http://archive.ubuntu.com/ubuntu raring main universe" > /etc/apt/sources.list
#RUN apt-get update

RUN apt-get update && apt-get install -y curl git procps build-essential libssl-dev libreadline-dev libxslt1-dev libxml2-dev libmagickwand-dev imagemagick g++ g++-4.8 make gnupg2 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV RUBY_MAJOR 1.9
ENV RUBY_VERSION 1.9.3-p545

ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/rvm/rubies/ruby-$RUBY_VERSION/bin

# install RVM, Ruby, and Bundler
RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -L https://get.rvm.io | bash -s stable
RUN rvm requirements
RUN rvm install $RUBY_VERSION
RUN rvm use $RUBY_VERSION --default
RUN gem install bundler --no-ri --no-rdoc

ENV RAILS_VERSION 3.2.21
RUN gem install rails --version $RAILS_VERSION

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y postgresql-client libpq-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]
