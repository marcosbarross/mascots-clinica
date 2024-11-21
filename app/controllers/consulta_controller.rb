class ConsultaController < ApplicationController
  before_action :set_consulta, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /consulta or /consulta.json
  def index
    @consulta = Consulta.all
    render json: @consulta
  end

  # GET /consulta/1 or /consulta/1.json
  def show
    render json: @consulta
  end

  # POST /consulta or /consulta.json
  def create
    @consulta = Consulta.new(consulta_params)
    if @consulta.save
      render json: @consulta, status: :created, location: @consulta
    else
      render json: @consulta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consulta/1 or /consulta/1.json
  def update
    if @consulta.update(consulta_params)
      render json: @consulta, status: :ok, location: @consulta
    else
      render json: @consulta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consulta/1 or /consulta/1.json
  def destroy
    @consulta.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_consulta
    @consulta = Consulta.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def consulta_params
    params.require(:consulta).permit(:veterinario, :animal_id, :data, :hora, :observacao)
  end
end
