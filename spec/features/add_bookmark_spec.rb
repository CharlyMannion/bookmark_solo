feature 'Adding a bookmark' do
  scenario 'A user can click a button to add a bookmarks' do
    add_test_data

    visit('/bookmarks/new')
    fill_in 'url', with: "https://www.everymancinema.com/york"
    click_button 'Submit'

    expect(page).to have_content("https://www.everymancinema.com/york")
  end
end
