feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content("https://www.picturehouses.com/cinema/city-screen-picturehouse")
    expect(page).to have_content("https://loveinternationalfestival.com/buy-tickets/")
    expect(page).to have_content("https://www.bbc.co.uk/weather/2641776")
  end
end
