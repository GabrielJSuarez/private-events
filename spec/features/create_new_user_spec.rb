require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  describe 'create user' do
    it 'creates a valid user' do
      visit new_user_path
      fill_in :name, with: 'Jose Suarez'
      click_button 'Sign up'
      expect(page).to have_content 'Jose Suarez'
    end

    it 'create a invalid user' do
      visit new_user_path
      fill_in :name, with: ''
      click_button 'Sign up'
      expect(page).to have_content 'Name can\'t be blank and Name is too short (minimum is 3 characters)'
    end
  end

  describe 'login user' do
    it 'Logs in with a valid user' do
      user = User.create(name: 'Jose Suarez')
      visit login_path
      fill_in :name, with: user.name
      click_button 'Log in!'
      expect(page).to have_content 'Jose Suarez'
    end

    it 'Logs in with a invalid user' do
      visit login_path
      fill_in :name, with: '111'
      click_button 'Log in!'
      expect(page).to have_content 'Wrong name or Name does not exist!'
    end
  end
end
