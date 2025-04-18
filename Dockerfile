FROM ruby:3.3.3-alpine AS base

RUN apk add --update \
  sqlite-dev \
  tzdata \
  libsodium-dev \
  ffmpeg \
  opus-dev \
  py3-pip \
  py3-virtualenv \
  imagemagick \
  imagemagick-dev \
  imagemagick-libs

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install yt-dlp

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
