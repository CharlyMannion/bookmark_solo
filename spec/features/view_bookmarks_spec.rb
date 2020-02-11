feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    add_test_data

    visit('/bookmarks')

    expect(page).to have_content("Picturehouse York")
    expect(page).to have_content("Love International")
    expect(page).to have_content("BBC Weather Nether Poppleton")
  end
end
