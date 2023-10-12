FROM ruby:2.7.1

WORKDIR /usr/src/robowilliams

COPY . .

RUN bundle install

CMD ["./run.sh"]
