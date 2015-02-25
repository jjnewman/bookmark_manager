require 'data_mapper'
require 'sinatra'
require 'link'
require 'tag'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

get '/' do
  @links = Link.all
  erb :index
end

post '/links' do
  url = params["url"]
  title = params["title"]
  tags = params["tags"].split(" ").map do |tag|
    Tag.first_or_create(:text => tag)
  end
  Link.create(:url => url, :title => title, :tags => tags)
  redirect to('/')
end

DataMapper.finalize
DataMapper.auto_upgrade!







# require 'sinatra/base'

# class bookmark_manager < Sinatra::Base
#   get '/' do
#     'Hello bookmark_manager!'
#   end

#   # start the server if ruby file executed directly
#   run! if app_file == $0
# end


