FROM ruby:slim

WORKDIR /app

COPY . ./

CMD ["ruby", "main.rb"]
