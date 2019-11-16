FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y nodejs npm default-mysql-client
RUN mkdir /time_to_answer
WORKDIR /time_to_answer
COPY Gemfile /time_to_answer/Gemfile
COPY Gemfile.lock /time_to_answer/Gemfile.lock
RUN bundle install
COPY . /time_to_answer

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]