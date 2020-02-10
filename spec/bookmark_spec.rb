require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.picturehouses.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://loveinternationalfestival.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.bbc.co.uk/weather/2641776');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.picturehouses.com")
      expect(bookmarks).to include("https://loveinternationalfestival.com")
      expect(bookmarks).to include("https://www.bbc.co.uk/weather/2641776")
    end
  end
end
