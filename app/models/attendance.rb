class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  validates :attendee_id, uniqueness: { scope: :attended_event_id, message: ': Already attending' }

  validate :past_date?

  def past_date?
    errors.add(:attended_event, ': You can\'t assist a past event') if attended_event.event_date < Time.now
  end
end
