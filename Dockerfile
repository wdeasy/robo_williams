FROM ruby:2.7.1
RUN mkdir /app
WORKDIR /app
ADD Gemfile* /app/
RUN bundle install
ADD . /app
RUN ["chmod", "+x", "/app/run.sh"]
CMD ["/app/run.sh"]