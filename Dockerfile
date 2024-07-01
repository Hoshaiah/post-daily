FROM ruby:3.1.1

# Update packages and install dependencies
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
        curl \
        gnupg2 \
        apt-utils \
        postgresql-client \
        postgresql-server-dev-all \
        git \
        libcurl4-openssl-dev \
        cmake \
        libssl-dev \
        pkg-config \
        openssl \
        imagemagick \
        file \
        nodejs \
        npm \
        yarn \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# Install Bundler gem
RUN gem install bundler

# Copy Gemfile and Gemfile.lock for dependency installation
COPY Gemfile* ./

# Install Ruby dependencies
RUN bundle install

# Copy the rest of the application code to the container
COPY . /app

