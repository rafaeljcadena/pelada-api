class ApiController < ApplicationController
	before_action :authenticate_user!
	# protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token, only: [:join_team, :unjoin_team]



	def usuarios
		
	end

	def peladas
		
	end

	def soccer_teams
		
	end

	def join_team


		binding.pry if Rails.env.development?
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

  def can_join_team?
  	@soccer_team = SoccerTeam.find(params[:user][:soccer_team_id])
  	# return @soccer_team.users.count > 0
  	return @soccer_team.vacancy_users > 0
  end

end
