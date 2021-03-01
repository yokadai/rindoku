class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms, validate: false
  has_many :messages, dependent: :destroy

  validates :room_name, presence: true
end
