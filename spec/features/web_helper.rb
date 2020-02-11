def add_test_data
  connection = PG.connect(dbname: 'bookmark_manager_test')

  # Add the test data
  connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.picturehouses.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('https://loveinternationalfestival.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.bbc.co.uk/weather/2641776');")
end
