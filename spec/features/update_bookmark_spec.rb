feature 'Updating a bookmark' do
  scenario 'A user can click a button to update a bookmark' do
    add_test_data

    visit('/bookmarks')
    expect(page).to have_link('Picturehouse York', href: 'https://www.picturehouses.com')

    first('.bookmark').click_button 'Update'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "http://www.picturehouses.com/cinema")
    fill_in('title', with: "York Picturehouse")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Picturehouse York', href: 'https://www.picturehouses.com')
    expect(page).to have_link('York Picturehouse', href: 'http://www.picturehouses.com/cinema')
    end
end
