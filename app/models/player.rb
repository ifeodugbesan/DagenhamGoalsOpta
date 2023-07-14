class Player < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :match_goals, through: :goals
  has_many :assists, dependent: :destroy
  has_many :team_players, dependent: :destroy
  has_many :teams, through: :team_players
  has_many :matches, through: :teams

  has_one_attached :photo
end
