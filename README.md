# Rails Labeled Log
A tool to use Rails Tagged Logging easily in your Ruby classes.

[![Gem Version](https://badge.fury.io/rb/rails-labeled_log.svg)](http://badge.fury.io/rb/rails-labeled_log)
[![Build Status](https://travis-ci.org/prodis/rails-labeled_log.svg?branch=master)](https://travis-ci.org/prodis/rails-labeled_log)
[![Coverage Status](https://coveralls.io/repos/prodis/rails-labeled_log/badge.svg?branch=master&service=github)](https://coveralls.io/github/prodis/rails-labeled_log?branch=master)
[![Code Climate](https://codeclimate.com/github/prodis/rails-labeled_log/badges/gpa.svg)](https://codeclimate.com/github/prodis/rails-labeled_log)
[![Dependency Status](https://gemnasium.com/prodis/rails-labeled_log.svg)](https://gemnasium.com/prodis/rails-labeled_log)


## Installing

### Gemfile

```ruby
gem 'rails-labeled_log'
```

### Direct installation

```console
$ gem install rails-labeled_log
```


## Using

### Rails::LabeledLog::Logging module

```ruby
require 'rails-labeled_log'

# Include Rails::LabeledLog::Logging module in your class
module FakeModule
  class FakeClass
    include Rails::LabeledLog::Logging

    def do_something
      # Log some info here
      log_info 'I did something'
    end
  end
end

fake = FakeModule::FakeClass.new
fake.do_something

# You also can use class methods
FakeModule::FakeClass.log_error 'Something was wrong'

# Optionally, you can supply additional labels for all log methods
FakeModule::FakeClass.log_warn 'Pay attention!', 'Warning'
```

Rails log will be labeled with the class name (and optinal additional labels):
```
[FakeModule::FakeClass] I did something at 2015-09-21 00:33:17 -0300
[FakeModule::FakeClass] Something was wrong at 2015-09-21 00:33:18 -0300
[FakeModule::FakeClass] [Warning] Pay attention! at 2015-09-21 00:33:19 -0300
```

##### Available (private) instance methods and class methods
- log_info
- log_error
- log_warn
- log_debug
- log_fatal

### Rails::LabeledLog::Logger class

```ruby
require 'rails-labeled_log'

logger = Rails::LabeledLog::Logger.new('One', 'Two')
logger.info 'My info message'
logger.info 'My info message', 'Three', 'Four'
```

In the Rails Log:
```
[One] [Two] My info message at 2015-09-21 01:01:43 -0300
[One] [Two] [Three] [Four] My info message at 2015-09-21 01:01:44 -0300
```

##### Available methods
- info
- error
- warn
- debug
- fatal


## Author
[Fernando Hamasaki de Amorim (prodis)](http://prodis.blog.br)

![Prodis Logo](http://prodis.net.br/images/prodis_150.gif)


## Contributing to Rails Labeled Log

- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Don't forget to rebase with branch master in main project before submit the pull request.
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

