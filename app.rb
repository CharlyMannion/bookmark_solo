require 'sinatra/base'
require './lib/bookmark'
require_relative './database_connection_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Hello Bookmark Manager!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  post '/bookmarks' do
    url = params["url"]
    title = params["title"]
    Bookmark.create(title: title, url: url)
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    # @bookmark_id = params[:id]
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
  Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
  redirect('/bookmarks')
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
