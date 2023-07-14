class MatchGoalsController < ApplicationController
  before_action :find_match, only: [:new, :create]
  def new
    @match_goal = MatchGoal.new
    @users = @match.players
    @oghome = Player.where(name: 'OG Home').first
    @ogaway = Player.where(name: 'OG Away').first
    @no_assist = Player.where(name: 'No Assist').first
  end

  def create
    scorer = Player.find(params[:match_goal][:goal])
    assister = Player.find(params[:match_goal][:assist])
    goal = Goal.create(player: scorer, season: 1)
    assist = Assist.create(player: assister, season: 1)
    if scorer.name == ("OG Home" || "OG Away")
      @team = scorer.name == "OG Home" ? @match.teams.first : @match.teams.last
    else
      @team = @match.teams.first.players.include?(scorer) ? @match.teams.first : @match.teams.last
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
