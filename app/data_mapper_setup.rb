env = ENV["RACK_ENV"] || "development"

require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_CRIMSON_URL'] || 'postgres://localhost/bookmark_manager_#{env}')
DataMapper.finalize
