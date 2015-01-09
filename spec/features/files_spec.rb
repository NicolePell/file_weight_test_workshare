require 'spec_helper'

feature 'files report' do
  context 'when logged in' do
    scenario 'a user sees a file report' do
      visit '/'
      fill_in 'email', with: 'pellicena@gmail.com'
      fill_in 'password', with: 'makersmake2014'
      click_button 'submit'
      expect(current_path).to eq '/files'
      expect(page).to have_content 'Inceptions'
    end
  end
end
