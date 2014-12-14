FROM rics3n/rails_base
MAINTAINER Rico Nuguid <rico@snib.it>

ENV NEWUSER rails_app

RUN useradd -m $NEWUSER
RUN adduser $NEWUSER sudo
USER $NEWUSER

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# throw errors if Gemfile has been modified since Gemfile.lock
ONBUILD RUN bundle config --global frozen 1

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD COPY Gemfile.lock /usr/src/app/
ONBUILD RUN bundle install

ONBUILD COPY . /usr/src/app

EXPOSE 3000
CMD rails server
