# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'checks if the value can be saved to the db' do
    user = User.new(name: '')
    expect(user).not_to be_valid
  end
end
