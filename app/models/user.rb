class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :user_rooms
    has_many :rooms, through: :user_rooms
    has_many :messages
         
    validates :name, presence: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
     
end
