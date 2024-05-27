# Ruby on Rails REST API Example

## Docker Dev
- `docker buildx build --platform linux/amd64 -t rails-dev -f Dockerfile.dev .`
- `docker run -it -p 3000:3000 -v $(pwd):/project rails-dev /bin/bash`

## Create project
`rails new rails_rest_api_example --database=postgresql`

## Install deps:
`bundle install`

## Start server:
`rails server -b 0.0.0.0`