def persist_page(link)
  within('form') do
    fill_in 'url', with: link
    click_button 'Add Page'
  end
end
