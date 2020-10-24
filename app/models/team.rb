class Team < ApplicationRecord
  belongs_to :match
  has_many :players, dependent: :destroy
  has_many :users, through: :players
end
