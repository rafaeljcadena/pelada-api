class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :sign_in_a_team, :sign_out_a_team]
  before_action :set_available_soccer_teams, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token

  # GET /users
  # GET /users.json
  def index
    @users = User.all.order(:nome).paginate(page: params[:page], per_page: 15)

    respond_to do |format|
      format.html
      format.json {render json: Oj.dump(@users.as_json(), mode: :compat)}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.html
      format.json {render json: Oj.dump(@user.as_json(), mode: :compat)}
    end
  end

  # GET /users/new
  def new
    @user = User.new
    # @user.build_address
    @soccer_teams = SoccerTeam.all
  end

  # GET /users/1/edit
  def edit

    # @user.build_address
    @soccer_teams = SoccerTeam.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        update_vacancy_soccer_team
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        update_vacancy_soccer_team
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    update_vacancy_soccer_team
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_available_soccer_teams
      @soccer_teams = SoccerTeam.where('vacancy_users > ?', 0)
    end

    def update_vacancy_soccer_team
      if (params[:user] && (params[:user][:soccer_team_id].present?))
        soccer = SoccerTeam.find(params[:user][:soccer_team_id])
        soccer.update_vacancy_soccer_team
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nome, :birthdate, :email, :cpf, :password, :password_confirmation, :descricao, :active, :position, :cell_phone, :soccer_team_id, :home_phone, address_attributes: [:street, :complement, :city, :cep, :state])
    end
end
