FROM ruby:slim

WORKDIR /app

COPY . ./

RUN bundle install

CMD ["bundle", "exec", "rspec"]
