feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    add_test_data
  
    visit('/bookmarks')

    expect(page).to have_content("https://www.picturehouses.com")
    expect(page).to have_content("https://loveinternationalfestival.com")
    expect(page).to have_content("https://www.bbc.co.uk/weather/2641776")
  end
end
