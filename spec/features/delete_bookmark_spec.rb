feature 'Deleting a bookmark' do
  scenario 'A user can click a button to delete a bookmarks' do
    add_test_data

    visit('/bookmarks')
    click_button 'Delete'
  end
end
