FROM ruby:2.7.1
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
RUN ["chmod", "+x", "/app/run.sh"]
CMD ["/app/run.sh"]