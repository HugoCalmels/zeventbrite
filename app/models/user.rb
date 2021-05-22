class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :created_events, foreign_key: 'creator', class_name: "Event"
end
