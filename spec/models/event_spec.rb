require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'associations' do
    it { should belong_to(:creator).class_name('User') }

    it { should have_many(:attendances).with_foreign_key('attended_event_id') }

    it { should have_many(:attendees).through(:attendances) }
  end

  describe 'validations' do
    it { should validate_presence_of(:event_name) }
    it { should validate_length_of(:event_name).is_at_least(5).is_at_most(26) }

    it { should validate_presence_of(:event_date) }

    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(10).is_at_most(144) }
  end

  describe 'event creation' do
    let(:user) { User.new(name: 'Gabriel') }

    it 'should save a valid event' do
      event = Event.new(event_name: 'Party', event_date: '31/12/12', description: 'Party mofos', creator: user)
      expect(event.save).to eq(true)
    end

    it 'should NOT save an invalid event' do
      event = Event.new(event_name: '', event_date: '31/12/12', description: 'Party mofos', creator: user)
      expect(event.save).to eq(false)
    end
  end
end
