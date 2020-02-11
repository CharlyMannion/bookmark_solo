feature 'Adding a bookmark' do
  scenario 'A user can click a button to add a bookmarks' do
    add_test_data

    visit('/bookmarks/new')
    fill_in 'url', with: "https://www.everymancinema.com/york"
    fill_in 'title', with: "Everyman York"
    click_button 'Submit'

    expect(page).to have_content("Everyman York")
  end
end
