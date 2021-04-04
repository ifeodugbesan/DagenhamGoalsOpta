class MatchGoalsController < ApplicationController
  before_action :find_match, only: [:new, :create]
  def new
    @match_goal = MatchGoal.new
    @users = @match.users
    @oghome = User.where(name: 'OG Home').first
    @ogaway = User.where(name: 'OG Away').first
    @no_assist = User.where(name: 'No Assist').first
  end

  def create
    scorer = User.find(params[:match_goal][:goal])
    assister = User.find(params[:match_goal][:assist])
    goal = Goal.create(user: scorer, season: 2)
    assist = Assist.create(user: assister, season: 2)
    if scorer.name == ("OG Home" || "OG Away")
      @team = scorer.name == "OG Home" ? @match.teams.first : @match.teams.last
    else
      @team = @match.teams.first.users.include?(scorer) ? @match.teams.first : @match.teams.last
    end
    MatchGoal.create!(match: @match, team: @team, goal: goal, assist: assist)
    redirect_to match_path(@match)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def find_match
    @match = Match.find(params[:match_id])
  end
end
