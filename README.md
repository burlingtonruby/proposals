# Proposals

Proposals is a Ruby on Rails and Ember application that handles Call for Proposals.

## Configuring Cutoff Date

In `application.rb`, set `config.cutoff_date` to the date when proposals close.
For example `config.cutoff_date = "March 17th, 2014".to_date`. Tests use a date
that is 60 days in the future and Timecop to test the future.
