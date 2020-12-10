class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 16 }
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances
end
