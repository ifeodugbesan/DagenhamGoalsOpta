class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def temp
  end

  def home
    @mvp = User.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by { |player| player.goals.where(season: 2).size + player.assists.where(season: 2).size }.reverse.first
  end

  def players
    @players = User.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').order(name: :asc)
  end

  def stats
    season_one_matches = User.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by { |user| user.matches.where(season: 1).size }.reverse
    season_two_matches = User.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by { |user| user.matches.where(season: 2).size }.reverse
    season_one_goals = season_one_matches.sort_by { |user| user.goals.where(season: 1).size }.reverse
    season_two_goals = season_two_matches.sort_by { |user| user.goals.where(season: 2).size }.reverse
    @season_one_players = season_one_goals.sort_by { |user| user.goals.where(season: 1).size + user.assists.where(season: 1).size }.reverse
    @season_two_players = season_two_goals.sort_by { |user| user.goals.where(season: 2).size + user.assists.where(season: 2).size }.reverse
  end
end
