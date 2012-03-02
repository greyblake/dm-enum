# dm-enum (Enumrated models for DataMapper)
by Potapov Sergey (aka Blake)

Inspired by [power\_enum](https://github.com/albertosaurus/enumerations_mixin)

## Description

Allows you to cache enumeration models.


## Installation

    gem install dm-enum

## Usage

```ruby

require 'dm-core'
require 'dm-enum'

class Language
  include DataMapper::Resource
  include DataMapper::Enum

  acts_as_enumerated :name_property => :code

  property :code, String, :key => true
  property :name, String
end

# should be called in order to cache values
Language.update_enums_cache!

Language.create(:code => "ru", :name => "Russian")
Language.create(:code => "en", :name => "English")

Language[:ru] # => #<Language @code="ru" @name="Russian">
Language["en"] # => #<Language @code="en" @name="English">

```


## Contributing to dm-enum

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Potapov Sergey. See LICENSE.txt for
further details.
