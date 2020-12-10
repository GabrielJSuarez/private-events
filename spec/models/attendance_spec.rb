require 'rails_helper'

RSpec.describe Attendance, type: :model do
  describe 'association' do
    it { should belong_to(:attendee).class_name('User') }

    it { should belong_to(:attended_event).class_name('Event') }

    it {
      should validate_uniqueness_of(:attendee_id).scoped_to(:attended_event_id)
        .with_message('User is already attending this event')
    }
  end

  describe 'Validations' do
    it {
      should validate_uniqueness_of(:attendee_id).scoped_to(:attended_event_id)
        .with_message('User is already attending this event')
    }
  end
end
