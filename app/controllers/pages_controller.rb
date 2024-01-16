class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def temp
  end

  # def home
  #   @mvp = Player.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by { |player| player.goals.where(season: 2).size + player.assists.where(season: 2).size }.reverse.first
  # end

  def stats
    season_one_matches = Player.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by { |user| user.matches.where(season: 1).size }.reverse
    season_two_matches = Player.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by { |user| user.matches.where(season: 2).size }.reverse
    # season_three_matches = Player.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by { |user| user.matches.where(season: 3).size }.reverse

    season_one_goals = season_one_matches.sort_by { |user| user.goals.where(season: 1).size }.reverse
    season_two_goals = season_two_matches.sort_by { |user| user.goals.where(season: 2).size }.reverse
    # season_three_goals = season_three_matches.sort_by { |user| user.goals.where(season: 3).size }.reverse

    @season_one_players = season_one_goals.sort_by { |user| user.goals.where(season: 1).size + user.assists.where(season: 1).size }.reverse
    @season_two_players = season_two_goals.sort_by { |user| user.goals.where(season: 2).size + user.assists.where(season: 2).size }.reverse
    # @season_three_players = season_three_goals.sort_by { |user| user.goals.where(season: 3).size + user.assists.where(season: 3).size }.reverse
  end
end
