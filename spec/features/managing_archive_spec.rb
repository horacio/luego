require 'rails_helper'

feature 'Manage the archive' do
  scenario 'Restoring a link from the archive' do
    archive_link('http://nplusonemag.com')

    restore_last_archived_link

    expect(page).to have_content('Link has been restored.')
  end
end
