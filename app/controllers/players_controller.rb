class PlayersController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
