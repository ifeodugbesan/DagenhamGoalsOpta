class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy, :result_confirmation]
  def index
    @matches = Match.all.order(created_at: :desc)
  end

  def show
    @winners = @match.teams.where(winners: true).first
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.season = 3
    if @match.save
      redirect_to match_path(@match)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @match.update(match_params)
    redirect_to match_path(@match)
  end

  def destroy
    @match.destroy
    redirect_to matches_path
  end

  def result_confirmation
    home_goals = @match.teams.first.goals.size
    away_goals = @match.teams.last.goals.size
    if home_goals > away_goals
      @match.teams.first.update(winners: true)
      @match.teams.last.update(losers: true)
    elsif away_goals > home_goals
      @match.teams.last.update(winners: true)
      @match.teams.first.update(losers: true)
    end
    @match.update(result_confirmed: true)
    redirect_to request.referrer
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:title, :date)
  end
end
