require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello Bookmark Manager!'
  end

  get '/bookmarks' do
    bookmarks = [
      "https://www.picturehouses.com/cinema/city-screen-picturehouse",
      "https://loveinternationalfestival.com/buy-tickets/",
      "https://www.bbc.co.uk/weather/2641776"
    ]
    bookmarks.join
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
