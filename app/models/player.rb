class Player < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :match_goals, through: :goals
  has_many :assists, dependent: :destroy
  has_many :team_players, dependent: :destroy
  has_many :teams, through: :team_players
  has_many :matches, through: :teams

  has_one_attached :photo

  def points
    total = 0
    matches.each do |m|
      if !m.teams.where(winners: true).present?
        total += 1
      elsif m.teams.select { |t| t.players.include?(self) }.first.winners
        total += 3
      end
    end

    total
  end
end
