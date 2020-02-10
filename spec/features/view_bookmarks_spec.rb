feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.picturehouses.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://loveinternationalfestival.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.bbc.co.uk/weather/2641776');")

    visit('/bookmarks')

    expect(page).to have_content("https://www.picturehouses.com")
    expect(page).to have_content("https://loveinternationalfestival.com")
    expect(page).to have_content("https://www.bbc.co.uk/weather/2641776")
  end
end
