class SoccerTeamsController < ApplicationController
  before_action :set_soccer_team, only: [:show, :edit, :update, :destroy]

  # GET /soccer_teams
  # GET /soccer_teams.json
  def index
    @soccer_teams = SoccerTeam.all.order(:team_name).paginate(page: params[:page], per_page: 15)
    respond_to do |format|
      format.html
      format.json {render json: Oj.dump(@soccer_teams.as_json(), mode: :compat)}
    end
  end

  # GET /soccer_teams/1
  # GET /soccer_teams/1.json
  def show
    if from_soccer_team?
      user = User.find(params[:user_id])
      user.update(soccer_team_id: nil, active: false)
    end
    
    @users = @soccer_team.users.paginate(page: params[:page], per_page: 15).order(:nome)

    respond_to do |format|
      format.html
      format.json {render json: Oj.dump(@soccer_team.as_json(), mode: :compat)}
    end

  end

  # GET /soccer_teams/new
  def new
    @soccer_team = SoccerTeam.new
  end

  # GET /soccer_teams/1/edit
  def edit
  end

  # POST /soccer_teams
  # POST /soccer_teams.json
  def create
    @soccer_team = SoccerTeam.new(soccer_team_params)

    respond_to do |format|
      if @soccer_team.save
        format.html { redirect_to @soccer_team, notice: 'Time criado com sucesso!' }
        format.json { render :show, status: :created, location: @soccer_team }
      else
        format.html { render :new }
        format.json { render json: @soccer_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soccer_teams/1
  # PATCH/PUT /soccer_teams/1.json
  def update
    respond_to do |format|
      if @soccer_team.update(soccer_team_params)
        format.html { redirect_to @soccer_team, notice: 'Time atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @soccer_team }
      else
        format.html { render :edit }
        format.json { render json: @soccer_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soccer_teams/1
  # DELETE /soccer_teams/1.json
  def destroy
    @soccer_team.destroy
    respond_to do |format|
      format.html { redirect_to soccer_teams_url, notice: 'Time removido com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soccer_team
      @soccer_team = SoccerTeam.find(params[:id])
    end

    def from_soccer_team?
      return params[:from_soccer_team] == "true"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soccer_team_params
      params.require(:soccer_team).permit(:team_name, :vacancy_users, :open_for_subscriptions)
    end
end
