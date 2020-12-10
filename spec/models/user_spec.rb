require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should validate_presence_of(:name) }

    it { should have_many(:created_events).with_foreign_key('creator_id').class_name('Event') }

    it { should have_many(:attendances).with_foreign_key('attendee_id') }

    it { should have_many(:attended_events).through(:attendances) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(16) }
  end

  describe 'user creation' do
    it 'should save a valid user' do
      user = User.new(name: 'Gabriel')
      expect(user.save).to eq(true)
    end

    it 'should NOT save an invalid user' do
      user = User.new(name: nil)
      expect(user.save).to eq(false)
    end
  end
end
