FROM ruby:2.7.1-alpine AS base

RUN apk add --update \
  sqlite-dev \
  tzdata

FROM base AS dependencies

RUN apk add --update build-base

COPY Gemfile* ./

RUN bundle config set without "development test" && \
  bundle install --jobs=3 --retry=3

FROM base

RUN adduser -D app

USER app

WORKDIR /home/app

COPY --from=dependencies /usr/local/bundle/ /usr/local/bundle/

COPY --chown=app . ./

CMD ["ruby", "bin/run.rb"]
