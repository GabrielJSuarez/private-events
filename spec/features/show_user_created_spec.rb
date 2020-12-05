require 'rails_helper'

RSpec.describe 'Showing a user', type: :feature do
  scenario 'Showing a created user' do
    @user = User.create(name: 'John Doe')
    visit user_path(@user)
    expect(page).to have_content('John Doe')
  end

end
