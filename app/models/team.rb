class Team < ApplicationRecord
  belongs_to :match
  has_many :players
  has_many :users, through: :players
end
