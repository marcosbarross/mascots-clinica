class ExamesController < ApplicationController
  before_action :set_exame, only: %i[ show update destroy ]
  

  # GET /exames or /exames.json
  def index
    @exames = Exame.all
    render json: @exames
  end

  # GET /exames/1 or /exames/1.json
  def show
    render json: @exame
  end

  # POST /exames or /exames.json
  def create
    @exame = Exame.new(exame_params)
    if @exame.save
      render json: @exame, status: :created, location: @exame
    else
      render json: @exame.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exames/1 or /exames/1.json
  def update
    if @exame.update(exame_params)
      render json: @exame, status: :ok, location: @exame
    else
      render json: @exame.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exames/1 or /exames/1.json
  def destroy
    @exame.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_exame
    @exame = Exame.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exame_params
    params.require(:exame).permit(:consulta_id, :nome_exame, :status_exame, :resultado)
  end
end
