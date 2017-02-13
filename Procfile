web: bundle exec passenger start -p $PORT --max-pool-size 3 --min-instances 1
worker: bundle exec sidekiq -q default -q mailers -v
