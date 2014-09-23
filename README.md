<a href="https://codeclimate.com/github/JTorr/inclusion_rails"><img src="https://codeclimate.com/github/JTorr/inclusion_rails/badges/gpa.svg" /></a>


INCLUSION RAILS README
======

What is It?
---------------

Inclusion Rails was written to make it easy to read a Gemfile and determine
what each gem does.

The app allows users to parse a Rails Gemfile, view individual gems and their
descriptions, save project gemfiles, and mark gems as "favorites" for future reference.

Users can also run the included rake task, "rake read", to create a list of gems
and gem descriptions in the vendor folder of their Rails application.


How Does it Work?
----------------

Inclusion Rails parses the Gemfile and connects to the RubyGems API,
pulling in the most current information for the included gems.

Installation
----------------
First, clone the project:

```
git clone https://github.com/JTorr/inclusion_rails.git
```

Go into the directory where it is installed, and bundle the gems:

```
cd inclusion_rails
bundle install
```

Then set up the database:

```
rake db:setup
```

Running the Application:
----------------

Option 1: Run as a Rails App

```
rails s
```

Option 2: Run in Command Line

Run the following command in your terminal, replacing "your_project_gemfile"
with your own project's name.

This will create a file vendor/gemfile-notes in your Rails application.

```
rake read < ../your_project_name/Gemfile > gemfile-notes
```

Feedback and Future Development
----

Features planned for future development:

* Bring in additional info on gems: gem_uri, version, dependencies, etc.
* Additional rake tasks


All bugs, feature requests, pull requests, feedback, etc., are welcome.
