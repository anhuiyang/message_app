require 'pry'
feature 'new message' do
  Timecop.freeze
  scenario 'send new message and display the first 20 characters'do
    visit '/'
    fill_in('message', :with => 'abcdefghijklmnopqrstuvwxyz')
    click_button('Send')
    expect(page).not_to have_content('uvwxyz')
    expect(page).to have_content('abcdefghijklmnopqrst')
  end
  scenario 'page to have link of the first 20 chars' do
    visit '/'
    fill_in('message', :with => 'abcdefghijklmnopqrstuvwxyz')
    click_button('Send')
    url = "/messages/#{Time.now.to_i}"
    expect(page).to have_link('abcdefghijklmnopqrst', href:"/messages/#{Time.now.to_i}")
  end
end
