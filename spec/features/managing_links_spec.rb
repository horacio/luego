require 'rails_helper'

feature 'Managing links' do
  scenario 'Add link to list' do
    sign_in_and_save_link('http://www.google.com')

    expect(page).to have_css('ul#links li', count: 1)
  end

  scenario 'Archive link from list' do
    sign_in_and_save_link('http://www.gv.com/designsprint')

    click_link 'Archive'

    expect(page).to have_content('Link has been archived.')
  end

  scenario 'Restoring a link from the archive' do
    sign_in_and_save_link('http://www.economist.com')

    click_link 'Archive'

    restore_last_archived_link

    expect(page).to have_content('Link has been restored.')
  end

  scenario 'Remove link from list' do
    sign_in_and_save_link('http://www.reddit.com')

    click_link 'Remove'

    expect(page).to have_content('Link has been deleted.')
  end
end
