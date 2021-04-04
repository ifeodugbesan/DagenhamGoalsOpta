class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @mvp = User.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by { |player| player.goals.where(season: 2).size + player.assists.where(season: 2).size }.reverse.first
  end

  def players
    @players = User.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').order(name: :asc)
  end

  def stats
    matches = User.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').sort_by {|user| user.matches.size }.reverse
    goals = matches.sort_by {|user| user.goals.size }.reverse
    @players = goals.sort_by {|user| user.goals.size + user.assists.size }.reverse
  end
end
