class MatchGoalsController < ApplicationController
  before_action :find_match, only: [:new, :create]
  def new
    @match_goal = MatchGoal.new
  end

  def create
    scorer = User.find(params[:match_goal][:goal])
    assister = User.find(params[:match_goal][:assist])
    goal = Goal.create(user: scorer)
    assist = Assist.create(user: assister)
    @team = @match.teams.first.users.include?(scorer) ? @match.teams.first : @match.teams.last
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
