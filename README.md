Scraper
======

Just run:

```ruby
# setup the database
bundle exec rake db:setup

# start rails server
rails s

# and in another terminal, start Sidekiq
bundle exec sidekiq
```

Then go to `localhost:3000` and start scraping yelp businesses!
