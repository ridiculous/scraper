How to use it
======

```ruby
# setup the database
bundle exec rake db:setup

# start rails server
rails s

# and in another terminal, start Sidekiq
bundle exec sidekiq
```

Then go to `localhost:3000` and start scraping yelp businesses!

Relevant Files
=========
[app/controllers/businesses_controller.rb](https://github.com/ridiculous/scraper/blob/master/app/controllers/businesses_controller.rb)

which calls the `YelpJob` in

[app/jobs/yelp_job.rb](https://github.com/ridiculous/scraper/blob/master/app/jobs/yelp_job.rb)

which is just used as an asynchronous wrapper around `YelpScraper`

[lib/yelp_scraper.rb](https://github.com/ridiculous/scraper/blob/master/lib/yelp_scraper.rb)

which does most the work.
