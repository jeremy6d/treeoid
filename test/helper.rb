require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mongoid'
require 'matchy'
require 'treeoid'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

Mongoid.configure do |config|
  name = "treeoid_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

class Test::Unit::TestCase
  def teardown
    Mongoid.master.collections.reject do |c| 
      c.name == 'system.indexes' 
    end.each(&:drop)
  end
end
