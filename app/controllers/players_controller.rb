class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  before_action :set_available_soccer_teams, only: [:show, :edit, :update, :destroy]


  # GET /players
  # GET /players.json
  def index
    @players = Player.all.order(:nome).paginate(page: params[:page], per_page: 15)
    
  end

  # GET /players/1
  # GET /players/1.json
  def show
    # respond_to do |format|
    #   format.html {render :show}
    #   format.json {render json: @player}
    # end
  end

  # GET /players/new
  def new
    @player = Player.new
    @player.build_address
    @soccer_teams = SoccerTeam.all
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    def set_available_soccer_teams
      @soccer_teams = SoccerTeam.where('vacancy_players > ?', 0)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:nome, :birthdate, :email, :cpf, :descricao, :active, :position, :cell_phone, :soccer_team_id, :home_phone, address_attributes: [:street, :complement, :city, :cep, :state])
    end


end
