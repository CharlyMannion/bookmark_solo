require 'bookmark'
require 'database_helpers'

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
      test_bookmark = Bookmark.create(title: 'Everyman', url: "https://everymancinema.com")
      p "test bookmark below"
      p test_bookmark.url
      persisted_data = persisted_data(id: test_bookmark.id)

      expect(test_bookmark.url).to eq("https://everymancinema.com")
      expect(test_bookmark.title).to eq('Everyman')
      expect(test_bookmark).to be_a(Bookmark)
    end
  end

  describe '.delete' do
    it 'deletes the selected bookmark' do
      bookmark = Bookmark.create(title: 'Everyman', url: "https://everymancinema.com")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq(0)
    end
  end

  describe '.update' do
    it 'updates the selected bookmark' do
      bookmark = Bookmark.create(title: 'Everyman', url: "https://everymancinema.com")
      updated_bookmark = Bookmark.update(id: bookmark.id, title: 'Everyman York', url: "https://everymancinema.com/york")

      expect(updated_bookmark).to be_a(Bookmark)
      expect(updated_bookmark.id).to eq(bookmark.id)
      expect(updated_bookmark.title).to eq('Everyman York')
      expect(updated_bookmark.url).to eq('https://everymancinema.com/york')
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Everyman', url: "https://everymancinema.com")

      p "in find"
      p bookmark
      p Bookmark
      p Bookmark.find(id: 1)
      p bookmark.id
      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a(Bookmark)
    end
  end
end
