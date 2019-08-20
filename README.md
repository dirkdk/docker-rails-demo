# Welcome to Docker Rails Demo
Rails, Docker and Webpacker is an awesome combination, for instance to develop React/Rails apps with.
This demo app uses [Rails 6](https://rubyonrails.org/), [Webpacker](https://github.com/rails/webpacker) and [Docker](https://www.docker.com/). In development mode, it uses [webpack-dev-server](https://github.com/webpack/webpack-dev-server) for live Javascript reloading. As database it uses [PostgreSQL](https://www.postgresql.org/).

Read the blog post with background info about his repository at [Running a Rails app with Webpacker and Docker](https://medium.com/@dirkdk/running-a-rails-app-with-webpacker-and-docker-8d29153d3446)

## First, build the app for development purposes
`docker-compose build`

## Create the database
`docker-compose run web scripts/wait-for-it.sh db:5432 --  "rake db:create db:migrate"`

## Run the app in development mode
`docker-compose up`

Now open http://localhost:3000 and look at your Javascript console to see messages

## Build the app for production
`docker build -t docker-rails-demo .`

Released under the  [MIT License](https://opensource.org/licenses/MIT)
