def archive_page(page)
  user_sign_in
  persist_page(page)
  click_link 'Archive'
end

def restore_last_archived_page
  visit archive_path

  within('#archived') do
    first('li').click_link 'Restore'
  end
end
