FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /app
COPY Gemfile* .
RUN gem install bundler -v 2.1.4 && bundle install
COPY . .
EXPOSE 5000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "5000"]
