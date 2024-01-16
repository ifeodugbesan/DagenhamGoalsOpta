class MatchGoalsController < ApplicationController
  before_action :find_match, only: [:new, :create, :edit, :update]

  def new
    @match_goal = MatchGoal.new
    @users = @match.players
    @oghome = Player.where(name: 'OG Home').first
    @ogaway = Player.where(name: 'OG Away').first
    @no_assist = Player.where(name: 'No Assist').first

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    scorer = Player.find(params[:match_goal][:goal])
    assister = Player.find(params[:match_goal][:assist])
    goal = Goal.create(player: scorer, season: 2)
    assist = Assist.create(player: assister, season: 2)
    if scorer.name == ("OG Home" || "OG Away")
      @team = scorer.name == "OG Home" ? @match.teams.first : @match.teams.last
    else
      @team = @match.teams.first.players.include?(scorer) ? @match.teams.first : @match.teams.last
    end
    MatchGoal.create!(match: @match, team: @team, goal: goal, assist: assist)
    redirect_to match_path(@match)
  end

  def edit
    @match_goal = MatchGoal.find(params[:id])
    @users = @match.players
    @oghome = Player.where(name: 'OG Home').first
    @ogaway = Player.where(name: 'OG Away').first
    @no_assist = Player.where(name: 'No Assist').first
  end

  def update
    @match_goal = MatchGoal.find(params[:id])
    @match_goal.goal.update(player_id: params[:match_goal][:goal])
    @match_goal.assist.update(player_id: params[:match_goal][:assist])

    scorer = Player.find(params[:match_goal][:goal])

    if scorer.name == ("OG Home" || "OG Away")
      @match_goal.update(team: scorer.name == "OG Home" ? @match.teams.first : @match.teams.last)
    else
      @match_goal.update(team: @match.teams.first.players.include?(scorer) ? @match.teams.first : @match.teams.last)
    end

    redirect_to match_path(@match_goal.match)
  end

  def destroy
    @match_goal = MatchGoal.find(params[:id])
    @match_goal.destroy
    redirect_to match_path(@match_goal.match)
  end

  private

  def find_match
    @match = Match.find(params[:match_id])
  end
end
