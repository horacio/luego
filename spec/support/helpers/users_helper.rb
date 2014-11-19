def user_sign_up(username, email, password)
  click_link 'Sign Up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign up'
end

def user_sign_in(user = nil)
  user = user || create(:user)

  visit root_path

  click_link 'Sign In'

  fill_in 'Email', with: user.email
  fill_in 'Password', with: 'password'

  click_button 'Sign in'
end
