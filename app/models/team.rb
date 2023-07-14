class Team < ApplicationRecord
  belongs_to :match
  has_many :match_goals
  has_many :goals, through: :match_goals, dependent: :destroy
  has_many :assists, through: :match_goals, dependent: :destroy
  has_many :team_players, dependent: :destroy
  has_many :players, through: :team_players
end
