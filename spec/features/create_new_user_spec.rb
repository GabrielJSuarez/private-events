require 'rails_helper'

RSpec.describe 'Creating a user', type: :feature do
  scenario 'Create a valid user' do
    visit new_user_path
    fill_in 'Name', with: 'Gabriel Suarez'
    click_on 'Create User'
    expect(page).to have_content('Gabriel Suarez')
  end

  scenario 'Create a invalid user' do
    visit new_user_path
    fill_in 'Name', with: ''
    click_on 'Create User'
    expect(page).to have_content('Name can\'t be blank')
  end
end
