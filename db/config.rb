require 'active_record'
require_relative '../app/models/legislator'
require_relative '../lib/sunlight_legislators_importer'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-sunlight-legislators.sqlite3")
