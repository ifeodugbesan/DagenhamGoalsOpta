class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def stats
    sort_match = User.where.not(name: 'OG').where.not(name: 'No Assist').sort_by {|user| user.matches.size }.reverse
    sort_goals = sort_match.sort_by {|user| user.goals.size }.reverse
    @players = sort_goals.sort_by {|user| user.goals.size + user.assists.size }.reverse
  end
end
