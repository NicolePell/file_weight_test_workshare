require 'spec_helper'

feature 'A user can login to access their Workshare account' do
  context 'when visiting the homepage' do
    scenario 'and entering their email and password' do
      visit '/'
      fill_in 'email', with: 'pellicena@gmail.com'
      fill_in 'password', with: 'makersmake2014'
      click_button 'submit'
      expect(page).to have_content 'You have successfully signed in'
    end
  end

  scenario 'a message is displayed when entering incorrect details' do
    visit '/'
    fill_in 'email', with: 'pellicena@gmail.com'
    fill_in 'password', with: 'wrong'
    click_button 'submit'
    expect(page).to have_content 'The user details you entered are not registered'
  end
end
