require 'spec_helper'

feature 'A user can login to access their Workshare account' do
  context 'when visiting the homepage' do
    scenario 'a user can enter their email and password' do
      visit '/'
      fill_in 'email', with: 'pellicena@gmail.com'
      fill_in 'password', with: 'test'
      click_button 'submit'
    end
  end
end
