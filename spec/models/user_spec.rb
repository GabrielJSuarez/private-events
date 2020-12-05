require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User table #Check_Validations' do
    it 'can not be save to the DB' do
      user = User.new(name: '')
      expect(user).not_to be_valid
    end

    it 'can be saved to the DB' do
      user = User.create(name: 'Gabriel Suárez')
      expect(User.last.name).to eq('Gabriel Suárez')
    end
  end
end