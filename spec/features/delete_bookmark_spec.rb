feature 'Deleting a bookmark' do
  scenario 'A user can click a button to delete a bookmarks' do
    add_test_data

    visit('/bookmarks')
    expect(page).to have_link('Picturehouse York', href: 'https://www.picturehouses.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Picturehouse York', href: 'https://www.picturehouses.com')
  end
end
