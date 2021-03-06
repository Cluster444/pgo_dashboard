# Use the barebones version of Ruby 2.2.3.
FROM ruby:2.3.1

# Install dependencies:
# - build-essential: To ensure certain gems can be compiled
# - nodejs: Compile assets
# - libpq-dev: Communicate with postgres through the postgres gem
# - postgresql-client-9.4: In case you want to talk directly to postgres
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 python-pip --fix-missing --no-install-recommends

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /drkiq
RUN mkdir -p /usr/src/app

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR /usr/src/app

 
# drastically increase build times when your gems do not change.
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD Gemfile Gemfile
RUN bundle install
ADD . .
RUN ls -l vendor/pgoapi
RUN pip install -r vendor/pgoapi/requirements.txt
# Copy in the application code from your work station at the current directory

RUN RAILS_ENV=production SECRET_KEY=abc123 DEVISE_SECRET_KEY=abc123 bundle exec rails assets:precompile

# Expose a volume so that nginx will be able to read in assets in production.
VOLUME ["/usr/src/app/public"]

# The default command that gets ran will be to start the Unicorn server.
CMD bundle exec unicorn -c config/unicorn.rb -E production
