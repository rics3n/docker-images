FROM rics3n/rails_base
MAINTAINER Rico Nuguid <rico@snib.it>

ENV NEWUSER rails_app

RUN useradd -m $NEWUSER
RUN adduser $NEWUSER sudo

RUN mkdir /data
RUN chown -R $NEWUSER /data

USER $NEWUSER
WORKDIR /data

# throw errors if Gemfile has been modified since Gemfile.lock
ONBUILD RUN bundle config --global frozen 1

ONBUILD COPY Gemfile /data
ONBUILD COPY Gemfile.lock /data
ONBUILD RUN bundle install

ONBUILD COPY . /data

EXPOSE 3000
CMD rails server
