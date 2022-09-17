FROM ruby:3.1.2-alpine3.14

RUN apk update
RUN apk add --no-cache linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev vim postgresql && \
  apk add --virtual build-packages --no-cache build-base curl-dev

ENV BUNDLE_PATH /bundle

WORKDIR /app
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle config set force_ruby_platform true
RUN bundle install

RUN apk del build-packages


COPY . .

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

ENV PATH $PATH:/app/bin
RUN echo $PATH


EXPOSE 3000

CMD [ "bin/rails", "server", "-b", "0.0.0.0" ]

