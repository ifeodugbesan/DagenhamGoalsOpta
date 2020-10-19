class Match < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  has_many :match_goals
  has_many :goals, through: :match_goals
  has_many :assists, through: :match_goals
end
