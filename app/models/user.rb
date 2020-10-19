class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goals
  has_many :match_goals, through: :goals
  has_many :assists
  has_many :players
  has_many :teams, through: :players
  has_many :matches, through: :teams
end
