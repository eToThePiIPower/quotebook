# Quotebook

[![CircleCI](https://circleci.com/gh/eToThePiIPower/quotebook.svg?style=svg)](https://circleci.com/gh/eToThePiIPower/quotebook)

(notes for v0.2.0)

Quotebook will be a simple application for collecting, managing, and recalling
interesting quotations and snippets. I was inspired to write it for two reasons:

* I often find myself reading a particularly insightful passage in a
  book, and wanting a way to collect such passages by topic
* I want my favorite passages to be available over simple API that I can use in
  a Jekyll blog to show random but tag-relevant flavor passages on blog posts.
* It would be to offer offline capabilities since I'm often on the subway when
  reading the passages that inspire me.

This project is a small personal project not really meant for production use.
Please utilize caution if you plan to deploy it.

## System dependencies

* Ruby 2.5.1 
* Rails 5.2+
* postgresql (9.5+, untested on earlier) ## Configuration 

We're using Spring & Guard so you may need to use the binstub versions instead of
the standard commands.

```
bin/bundle install
bin/rake db:setup
bin/rails server
```

We're also using dotenv for environment variable management. You will probably
need to set a Devise secret key in by creating a `.env` file and adding the
following line:

```
DEVISE_SECRET_KEY=<any random 128-bit hex number>
```

If you don't do this, you may get an error on database setup that includes a
generated secret key you can use.

## Testing

Quotebook utilizes CircleCI for continuous integration, which runs both the
RSpec test suite and Rubocop linting tool. You can run them in your development
environment in the usual manner:

```
bundle exec rspec
bundle exec rubocop

```
