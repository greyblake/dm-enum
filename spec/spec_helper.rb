$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'pry'

require 'dm-core'
require 'dm-migrations'
require 'dm-sqlite-adapter'

require 'dm-enum'


DataMapper.setup(:default, "sqlite3::memory:")


class Language
  include DataMapper::Resource
  include DataMapper::Enum
  acts_as_enumerated :name_property => :code
  property :code, String, :key => true
  property :name, String
end

class Country
  include DataMapper::Resource
  include DataMapper::Enum
  acts_as_enumerated
  property :name, String, :key => true
end

class City
  include DataMapper::Resource
  include DataMapper::Enum
  acts_as_enumerated
  property :name, String, :key => true
end

DataMapper.finalize
DataMapper.auto_migrate!
