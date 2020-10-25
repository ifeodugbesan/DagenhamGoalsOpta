class Match < ApplicationRecord
  has_many :match_goals
  has_many :goals, through: :match_goals, dependent: :destroy
  has_many :assists, through: :match_goals, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :users, through: :teams

  def score
     "#{match_goals.select {|m| m.team.home == true }.size} - #{match_goals.select {|m| m.team.home == false }.size}"
  end

  def home_goals
    match_goals.select {|m| m.team.home == true }
  end

  def away_goals
    match_goals.select {|m| m.team.home == false }
  end
end
