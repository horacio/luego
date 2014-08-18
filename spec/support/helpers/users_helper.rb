def user_sign_up(username, email, password)
  click_link 'Sign up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign up'
end

def user_sign_in(user = nil)
  user = user || create(:user)

  visit root_path

  click_link 'Sign in'

  fill_in 'Email', with: user.email
  fill_in 'Password', with: 'password'

  click_button 'Sign in'
end

def save_link(link)
  within('form') do
    fill_in 'url', with: link
    click_button 'Add'
  end
end

def sign_in_and_save_link(link)
  user_sign_in
  save_link(link)
end

def restore_last_archived_link
  visit archive_path

  within('#archived') do
    first('li').click_link 'Restore'
  end
end
