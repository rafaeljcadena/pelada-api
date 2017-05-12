class PeladasController < ApplicationController
  before_action :set_pelada, only: [:show, :edit, :update, :destroy]

  # GET /peladas
  # GET /peladas.json
  def index
    @peladas = Pelada.all
  end

  # GET /peladas/1
  # GET /peladas/1.json
  def show
  end

  # GET /peladas/new
  def new
    @pelada = Pelada.new
  end

  # GET /peladas/1/edit
  def edit
  end

  # POST /peladas
  # POST /peladas.json
  def create
    @pelada = Pelada.new(pelada_params)

    respond_to do |format|
      if @pelada.save
        format.html { redirect_to @pelada, notice: 'Pelada was successfully created.' }
        format.json { render :show, status: :created, location: @pelada }
      else
        format.html { render :new }
        format.json { render json: @pelada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peladas/1
  # PATCH/PUT /peladas/1.json
  def update
    respond_to do |format|
      if @pelada.update(pelada_params)
        format.html { redirect_to @pelada, notice: 'Pelada was successfully updated.' }
        format.json { render :show, status: :ok, location: @pelada }
      else
        format.html { render :edit }
        format.json { render json: @pelada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peladas/1
  # DELETE /peladas/1.json
  def destroy
    @pelada.destroy
    respond_to do |format|
      format.html { redirect_to peladas_url, notice: 'Pelada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pelada
      @pelada = Pelada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pelada_params
      params.require(:pelada).permit(:title, :begin, :guest_id, :host_id)
    end
end
