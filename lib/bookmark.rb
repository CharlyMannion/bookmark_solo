# require 'pg'
require_relative 'database_connection'

class Bookmark

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmark.new(
        url: bookmark['url'],
        title: bookmark['title'],
        id: bookmark['id']
      )
    end
  end

  def self.create(url:, title:)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

def self.delete(id:)
  DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
end

def self.update(id:, title:, url:)
  result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
  Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
end

def self.find(id:)
  result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
  Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
end

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  private

  def self.is_url?(url)
    url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end

  # def self.all
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end
  #   result = DatabaseConnection.query("SELECT * FROM bookmarks;")
  #   result.map { |bookmark|
  #     Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  # end

  # def self.create(title:, url:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  #
  #   result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title;")
  #   Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  # end
  #
  # def self.delete(id:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  #
  #   connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  # end
  #
  # def self.update(id:, title:, url:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  #
  #   result = connection.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
  #   Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  # end
  #
  # def self.find(id:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  #
  #   result = connection.exec("SELECT * FROM bookmarks WHERE id = #{id};")
  #   Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  # end
end
