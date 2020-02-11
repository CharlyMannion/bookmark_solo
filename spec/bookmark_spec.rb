require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      add_test_data

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a Bookmark
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      test_bookmark = Bookmark.create(title: 'Everyman', url: "https://everymancinema.com").first

      expect(test_bookmark['url']).to eq("https://everymancinema.com")
      expect(test_bookmark['title']).to eq('Everyman')
    end
  end
end
