# Sidekiq::Worker::RakeTasks

Small gem to provide rake tasks for workers in your rails app.

This makes it easier to test and debug workers, as they can be run at anytime from the commandline.

## Example Usage

Add the rake tasks to your Rakefile

> Rakefile
```ruby
require 'sidekiq/worker/rake_tasks'
```

Create your workers, and include Sidekiq::Worker::RakeTasks, then declare any expected arguments to your "perform" method.

> app/workers/update_user_image_worker.rb
```ruby
class UpdateUserImageWorker
  include Sidekiq::Worker
  include Sidekiq::Worker::RakeTasks

  expected_arguments :user_id, :image_url

  def perform (*args_list)

  end
end
```

Then the tasks will be available via rake, with the declared expected options.

```shell
$ rake -T sidekiq
sidekiq:update_user_image[user_id, image_url] # Update user image
$ rake sidekiq:update_user_image[100, "http://facebook.com/blah.jpg"]
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'sidekiq-worker-rake_tasks'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install sidekiq-worker-rake-tasks
```

## Contributing
Fork, pull, create feature branch, test, code, submit PR

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
