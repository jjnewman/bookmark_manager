require 'data_mapper'
require 'sinatra'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require 'link'

get '/' do
  @links = Link.all
  erb :index
end


DataMapper.finalize

DataMapper.auto_upgrade!


