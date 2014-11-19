require 'rails_helper'

feature 'Visiting the homepage' do
  scenario 'Salutes an anonymous user' do
    visit root_path

    expect(page).to have_content('Welcome to Luego')
  end

  scenario 'Allows an anonymous user to sign up for an account' do
    visit root_path

    expect(page).to have_link('Sign Up')
  end

  scenario 'Allows an anonymous user to sign in into their account' do
    visit root_path

    expect(page).to have_link('Sign In')
  end
end
