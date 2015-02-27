env = ENV["RACK_ENV"] || "development"

require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

# configure :development do
#     DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
# end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")



DataMapper.finalize

# require 'data_mapper'
# DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/bookmark_manager_#{env}')

#DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://user:password@hostname/data/mydatabase.db')