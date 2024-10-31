class PrescricaoMedicasController < ApplicationController
  before_action :set_prescricao_medica, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /prescricao_medicas or /prescricao_medicas.json
  def index
    @prescricao_medicas = PrescricaoMedica.all
    render json: @prescricao_medicas
  end

  # GET /prescricao_medicas/1 or /prescricao_medicas/1.json
  def show
    render json: @prescricao_medica
  end

  # POST /prescricao_medicas or /prescricao_medicas.json
  def create
    @prescricao_medica = PrescricaoMedica.new(prescricao_medica_params)
    if @prescricao_medica.save
      render json: @prescricao_medica, status: :created, location: @prescricao_medica
    else
      render json: @prescricao_medica.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prescricao_medicas/1 or /prescricao_medicas/1.json
  def update
    if @prescricao_medica.update(prescricao_medica_params)
      render json: @prescricao_medica, status: :ok, location: @prescricao_medica
    else
      render json: @prescricao_medica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prescricao_medicas/1 or /prescricao_medicas/1.json
  def destroy
    @prescricao_medica.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_prescricao_medica
    @prescricao_medica = PrescricaoMedica.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def prescricao_medica_params
    params.require(:prescricao_medica).permit(:consulta_id, :data, :medicamentos_prescritos, :dosagens, :observacao)
  end
end
