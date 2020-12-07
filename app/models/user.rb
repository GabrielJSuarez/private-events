class User < ApplicationRecord
  validates_presence_of :name
  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
end
