require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.picturehouses.com")
      expect(bookmarks).to include("https://loveinternationalfestival.com")
      expect(bookmarks).to include("https://www.bbc.co.uk/weather/2641776")
    end
  end
end
