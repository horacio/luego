require 'rails_helper'

feature 'Manage the archive' do
  scenario 'Restoring a page from the archive' do
    archive_page('http://nplusonemag.com')

    restore_last_archived_page

    expect(page).to have_content('Page has been restored.')
  end
end
