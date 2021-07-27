# Use the Ruby 2.7.3 image from Docker Hub
# as the base image (https://hub.docker.com/_/ruby)
FROM ruby:2.7.3

RUN apt-get update && \
  apt-get install -qq -y --no-install-recommends cron && \
  rm -rf /var/lib/apt/lists/*
  
# Use a directory called /code in which to store
# this application's files. (The directory name
# is arbitrary and could have been anything.)
WORKDIR /code

# Copy all the application's files into the /code
# directory.
COPY . /code

# Run bundle install to install the Ruby dependencies.
RUN bundle install

# Install Yarn.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
RUN apt-get update && apt-get install nano

# Run yarn install to install JavaScript dependencies.
RUN yarn install --check-files
RUN bundle exec whenever --update-crontab

# Set "rails server -b 0.0.0.0" as the command to
# run when this container starts.
CMD cron && bundle exec rails server
