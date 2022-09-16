FROM ruby:3.1.2-alpine3.14

RUN apk update
RUN apk add --no-cache linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql && \
  apk add --virtual build-packages --no-cache build-base curl-dev

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN bundle config set force_ruby_platform true
RUN bundle install

ENTRYPOINT [ "bin/rails" ]
CMD [ "server", "-b", "0.0.0.0" ]

EXPOSE 3000
