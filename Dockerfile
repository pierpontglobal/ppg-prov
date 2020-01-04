FROM ruby:2.6.5-alpine3.10

# update and upgrade packages
RUN apk update && apk upgrade

# install dependencies
RUN apk add --no-cache \
    openssl \
    bash \
    build-base \
    # application dependencies
    postgresql-client \
    postgresql-dev \
    # clean up after installation
    && rm -rf /var/cache/apk/*

ENV BUNDLER_VERSION=2.1.3
ENV GEM_HOME=/usr/local/bundle
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
ENV APP_HOME /home/app

RUN mkdir -p ${APP_HOME}
COPY . $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler -v ${BUNDLER_VERSION}
RUN bundle config set path ${GEM_HOME}
RUN bundle config set deployment 'true'
RUN bundle config set frozen 'true'
RUN bundle _${BUNDLER_VERSION}_ install \
  --jobs 4 \
  --retry 2 && bundle _${BUNDLER_VERSION}_ check

EXPOSE 3000
CMD ./bin/start.sh