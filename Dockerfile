FROM ruby:slim

WORKDIR /app

COPY . ./

RUN bundle install

CMD ["bundle", "exec", "ruby", "spec/test_suite.rb"]
