class TeamsController < ApplicationController
  before_action :find_match, only: [:new, :create, :edit, :update]
  def index
  end

  def show
  end

  def new
    @team = Team.new
    @users = Player.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').order(name: :asc)
  end

  def create
    @team = Team.new(match: @match)
    @team.captain = params[:team][:captain]
    params[:team][:home] == "true" ? @team.home = true : @team.home = false
    @team.season = 1
    @team.save
    @players = params[:team][:players].reject(&:blank?).map { |player| TeamPlayer.create(team: @team, player: Player.find(player.to_i)) }
    @players << TeamPlayer.create(team: @team, player: Player.find_by(name: params[:team][:captain]))
    @team.team_players = @players
    redirect_to match_path(@match)
  end

  def edit
    @team = Team.find(params[:id])
    @users = Player.where.not(name: 'OG Home').where.not(name: 'OG Away').where.not(name: 'No Assist').order(name: :asc)
    @players = @team.players.reject { |p| p.name == @team.captain }.map(&:id)
  end

  def update
    @team = Team.find(params[:id])
    @team.update(captain: params[:team][:captain])
    @team.team_players.destroy_all
    @players = params[:team][:players].reject(&:blank?).map { |player| TeamPlayer.create(team: @team, player: Player.find(player.to_i)) }
    @players << TeamPlayer.create(team: @team, player: Player.find_by(name: params[:team][:captain]))
    @team.team_players = @players
    redirect_to match_path(@match)
  end

  def destroy
  end

  private

  def find_match
    @match = Match.find(params[:match_id])
  end

  def team_params
    params.require(:team).permit(:captain, players: [])
  end
end
