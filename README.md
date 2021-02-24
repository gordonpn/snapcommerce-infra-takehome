# Snapcommerce Infra Co-op Takehome Challenge

## Description

In this challenge, you will take a legacy hello-world HTTP server app, containerize it using Docker, and deploy it to the cloud.

You do not need any previous experience with Ruby on Rails to complete this challenge, and no modifications or additions to the application code are necessary. You should be able to complete the challenge using a combination of the legacy app README below, previous experience, and online research. There is no time limit, but you should be able to complete it in less than 4 hours.

You may use any technologies or platforms you want, but you must containerize the application yourself and include a Dockerfile.

## Requirements

1. The application is containerized via a Dockerfile placed in the root of the project. If someone were to run `docker build .` it would complete successfully.
1. On every push to master:
    1. A docker image is built for the commit
    1. The test suite is executed inside a container launched using the image built in step 1
    1. Only if the test suite passes, the application is deployed/upgraded using the image built in step 1
1. The application is accessible over HTTPS over the public internet at an address provided by you at the root path. Eg. https://some-domain.somewhere.com/
1. The message displayed is "Hello world from production!". The last word in the message is controlled via the environment variable RAILS_ENV. Do not hardcode the value "production" into the application code or the built Docker image. Set the environment variable correctly at container launch time depending on your chosen platform / technology stack.

## Bonus objectives

Presented in decreasing order of value. Do not implement all of these, one or two (or zero) is just fine.

- Zero downtime upgrades: the application is available all throughout the deployment process
- Scalable horizontally and vertically: your deployment can handle arbitrary levels of traffic simply by adjusting configuration and spending more money. Assume for the purposes of this objective that the message is not static (no caches in front of the application are allowed)
- IaC (Infrastructure as Code): as much configuration as possible is stored in the git repo in text files, except for the value of RAILS_ENV
- Build step is fast, especially if nothing has changed in the library dependencies since a previous commit
- Local docker development: docker-compose.yaml file that allows developers to develop locally in a container
- Valid SSL certificate: No SSL warnings or errors in the latest version of Chrome, a padlock icon is displayed
- Some other feature/improvement over the basic requirements that you'd like to highlight

## Short-form questions

Answer these questions in the README of your submission

1. What is the URL of the hosted application?

1. Briefly describe the technologies/platforms used (besides Docker and RoR). Describe where in the git repo these technologies/platforms are configured. If there are technologies/platforms configured manually in a web GUI or similar, include screenshots of all of the configuration.

1. Did you achieve any of the bonus objectives? Which ones and how?

# Legacy application README

## Setup / prerequisites

Requires MRI Ruby v2.7.2

Requires bundler 2.1.4: `gem install bundler -v 2.1.4`
 
To install library dependencies: `bundle install`

## Running the test suite

To run the test suite: `bundle exec rspec -fd`

## Running the server

To run the http server bound to all interfaces and listening to port 5000: `bundle exec rails server -b 0.0.0.0 -p 5000`
