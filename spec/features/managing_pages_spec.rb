require 'rails_helper'

feature 'Managing pages' do
  scenario 'Add page to list' do
    user_sign_in

    persist_page('http://www.google.com')

    expect(page).to have_css('ul#pages li', count: 1)
  end

  scenario 'Archive page from list' do
    user_sign_in

    persist_page('http://www.gv.com/designsprint')

    click_link 'Archive'

    expect(page).to have_content('Page has been archived.')
  end

  scenario 'Remove page from list' do
    user_sign_in

    persist_page('http://www.reddit.com')

    click_link 'Remove'

    expect(page).to have_content('Page has been deleted.')
  end
end
