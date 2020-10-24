class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  def index
    @matches = Match.all.reverse
  end

  def show
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
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

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:title, :date)
  end
end
