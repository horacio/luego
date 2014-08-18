require 'rails_helper'

feature 'Managing dead simple users' do
  scenario 'An anonymous user can sign in' do
    user = create(:user)

    user_sign_in(user)

    expect(page).to have_content(user.username)
  end

  scenario 'An anonymous user can sign up' do
    visit root_path

    user_sign_up('test', 'new@example.com', 'password')

    expect(page).to have_content('test')
  end
end
