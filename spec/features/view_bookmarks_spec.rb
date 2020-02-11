feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    add_test_data

    visit('/bookmarks')

    expect(page).to have_content("Picturehouse York")
    expect(page).to have_content("Love International")
    expect(page).to have_content("BBC Weather Nether Poppleton")
    expect(page).to have_link('Picturehouse York', href: 'https://www.picturehouses.com')
  end
end
