class ConsultaController < ApplicationController
  before_action :set_consultum, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /consulta or /consulta.json
  def index
    @consulta = Consultum.all
    render json: @consulta
  end

  # GET /consulta/1 or /consulta/1.json
  def show
    render json: @consultum
  end

  # POST /consulta or /consulta.json
  def create
    @consultum = Consultum.new(consultum_params)
    if @consultum.save
      render json: @consultum, status: :created, location: @consultum
    else
      render json: @consultum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consulta/1 or /consulta/1.json
  def update
    if @consultum.update(consultum_params)
      render json: @consultum, status: :ok, location: @consultum
    else
      render json: @consultum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consulta/1 or /consulta/1.json
  def destroy
    @consultum.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_consultum
    @consultum = Consultum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def consultum_params
    params.require(:consultum).permit(:veterinario, :animal_id, :data, :hora, :observacao)
  end
end
