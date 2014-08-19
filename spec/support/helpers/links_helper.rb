def sign_in_and_save_link(link)
  user_sign_in
  save_link(link)
end

def save_link(link)
  within('form') do
    fill_in 'url', with: link
    click_button 'Add'
  end
end
