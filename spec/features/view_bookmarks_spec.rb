feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content("https://www.picturehouses.com/cinema/city-screen-picturehouse")
  end
end
