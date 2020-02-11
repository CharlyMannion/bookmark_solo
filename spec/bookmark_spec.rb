require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      add_test_data

      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.picturehouses.com")
      expect(bookmarks).to include("https://loveinternationalfestival.com")
      expect(bookmarks).to include("https://www.bbc.co.uk/weather/2641776")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: "https://everymancinema.com")

      expect(Bookmark.all).to include("https://everymancinema.com")
    end
  end
end
