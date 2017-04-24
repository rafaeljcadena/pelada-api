class PlayersController < ApplicationController
  before_action :authenticate_user!

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(player_params)
    respond_to do |format|
      if @player.save
        format.html { redirect_to player_path, notice: "#{t('activerecord.models.player.one')} criado com sucesso" }
        format.json { render action: 'index', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
    @player = Player.find(params[:id])
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_path, notice: "#{t('activerecord.models.player.one')} atualizado com sucesso." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_params

    byebug if Rails.env == "development"

    params.require(:player).permit(:nome, :birthdate, :cpf, :descricao, :active, :position, :cell_phone, :home_phone, presence: true)
  end


end
