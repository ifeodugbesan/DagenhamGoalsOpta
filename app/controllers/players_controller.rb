class PlayersController < ApplicationController
  before_action :set_player, only: [:edit, :update, :destroy]

  def index
     @players = Player.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').order(name: :asc)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to players_path
  end

  def destroy
    @player.destroy
    redirect_to players_path
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :photo)
  end
end
