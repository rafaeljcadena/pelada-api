class ApiController < ApplicationController
	skip_before_action :authenticate_user!, only: [:sign_in_user]
	# protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token, only: [:sign_in_user, :join_team, :unjoin_team]



	def sign_in_user
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json {render json: Oj.dump(@user.as_json(), mode: :compat)}
      else
        # format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end


	def join_team


		# binding.pry if Rails.env.development?
		@user = User.find(params[:user][:id])

    respond_to do |format|
      if can_join_team? && @user.update(join_params)
	      format.json {render json: Oj.dump(@user.as_json(), mode: :compat), status: :ok}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	def unjoin_team
		@user = User.find(params[:user][:id])

    respond_to do |format|
      if @user.update(soccer_team_id: nil)
	      format.json {render json: Oj.dump(@user.as_json(), mode: :compat), status: :ok}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	def method_name
		
	end

	private

  def join_params
    params.require(:user).permit(:id, :soccer_team_id)
  end

  def unjoin_params
    params.require(:user).permit(:id)
  end

  def user_params
    params.require(:user).permit(:nome, :birthdate, :email, :cpf, :password, :password_confirmation, :descricao, :active, :position, :cell_phone, :soccer_team_id, :home_phone, address_attributes: [:street, :complement, :city, :cep, :state])
  end

  def can_join_team?
  	@soccer_team = SoccerTeam.find(params[:user][:soccer_team_id])
  	# return @soccer_team.users.count > 0
  	return @soccer_team.vacancy_users > 0
  end

end
