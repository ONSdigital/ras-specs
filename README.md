# ras-specs
RAS BDD specifications

Contains BDD-style executable specifications for RAS services. The tests rely on Cucumber BDD framework, which in turn relies on Ruby. Read more about Cucumber [here](https://github.com/cucumber/cucumber-ruby).


## Setup

1. Needs Ruby, Ruby [RVM](https://rvm.io/) is recommended for installation of Ruby.
2. Also needs [bundler](http://bundler.io/).

Once 1 and 2 are configured, then do `bundle install` to setup the ras-specs dependencies.

## Linux Setup

1. Install cucumber onTO your system

	/> sudo apt install cucumber

2. Install GEM bundler onto your system

	/> sudo gem install bundler

3. Now setup the 'bundler' system

	/> bundle install



## Running

Run cucumber from the command-line, passing in the environment to run against and (optionally) any 'tags' to restrict which tests get executed. E.g:

``` Shell
cucumber ONS_ENV=dev --tags @party
```
Which will execute all tests tagged with 'parties' against the dev environment.
