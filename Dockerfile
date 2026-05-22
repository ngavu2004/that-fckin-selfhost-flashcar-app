FROM ruby:3.2

WORKDIR /app
COPY . .
RUN bundle install
EXPOSE 3001
CMD ["rails", "server", "-b", "0.0.0.0"]