class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances

  validates :event_name, presence: true, length: { minimum: 5, maximum: 26 }
  validates_presence_of :event_date
  validates :description, presence: true, length: { minimum: 10, maximum: 144 }

  scope :upcoming_events, -> { where('event_date >= ?', Time.now) }
  scope :past_events, -> { where('event_Date < ?', Time.now)}
end
