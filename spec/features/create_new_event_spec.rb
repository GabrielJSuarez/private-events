require 'rails_helper'

RSpec.describe 'Create an Event', type: :feature do
  before do
    user = User.create(name: 'Gabriel')
    visit login_path
    fill_in :name, with: user.name
    click_button 'Log in!'
    visit new_event_path
  end

  scenario 'Creating a valid Event' do
    fill_in 'Enter Event\'s Name', with: 'Party!'
    fill_in 'Pick the event\'s date', with: '31/12/2020'
    fill_in 'Enter event description', with: 'Come to my party!'
    click_button 'Create Event'
    expect(page).to have_content('Event created successfully')
  end

  scenario 'Creating an Invalid Event' do
    fill_in 'Enter Event\'s Name', with: ''
    fill_in 'Pick the event\'s date', with: '31/12/2020'
    fill_in 'Enter event description', with: 'Come to my party!'
    click_button 'Create Event'
    expect(page).to have_content('Event name can\'t be blank')
  end
end

