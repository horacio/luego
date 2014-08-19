def archive_link(link)
  sign_in_and_save_link(link)
  click_link 'Archive'
end

def restore_last_archived_link
  visit archive_path

  within('#archived') do
    first('li').click_link 'Restore'
  end
end
