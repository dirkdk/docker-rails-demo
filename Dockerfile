FROM ruby:3.3.0-slim
ARG precompileassets
ENV NODE_MAJOR=21
ENV BUNDLER_VERSION="2.5.5"

RUN apt-get update && apt-get install -y curl gnupg
# bullseye = debian 11
# bookworm = debian 12
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN curl -q https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get -y update && \
      apt-get install --fix-missing --no-install-recommends -qq -y \
        build-essential \
        vim \
        wget gnupg \
        git-all \
        curl \
        ssh \
        postgresql-client-14 libpq5 libpq-dev -y

RUN apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_MAJOR}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && \
      apt-get install nodejs -y && \
      apt-get update && \
      npm install --global yarn && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN gem install bundler -v ${BUNDLER_VERSION}
#Install gems
RUN mkdir /gems
WORKDIR /gems
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

ARG INSTALL_PATH=/opt/dockerrailsdemo
ENV INSTALL_PATH $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY . .

RUN scripts/potential_asset_precompile.sh $precompileassets
