class ConsultasController < ApplicationController
  before_action :set_consulta, only: %i[ show update destroy ]
  before_action :set_veterinario, only: [:by_veterinario]
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
  
  def by_veterinario
    @consultas = Consulta.where(funcionario_id: params[:id])
    render json: @consultas
  end
  
  # GET /consultas/by_animal/:animal_id
  # Retorna todas as consultas associadas a um animal específico
  def by_animal
    begin
      @consultas = Consulta.where(animal_id: params[:animal_id])
      render json: @consultas, status: :ok
    rescue => e
      render json: { error: "Erro ao buscar consultas do animal: #{e.message}" }, status: :internal_server_error
    end
  end

  # GET /consultas/by_tutor/:tutor_id
  # Retorna todas as consultas de todos os animais associados a um tutor específico
  def by_tutor
    begin
      @animals = Animal.where(tutor_id: params[:tutor_id])

      @consultas = Consulta.where(animal_id: @animals.pluck(:id))
      render json: @consultas, status: :ok
    rescue => e
      render json: { error: "Erro ao buscar consultas do tutor: #{e.message}" }, status: :internal_server_error
    end
  end

  def animais_atendidos
    begin
      # Encontrar todas as consultas feitas pelo veterinário
      @consultas = Consulta.where(funcionario_id: params[:funcionario_id])
      print @consultas.all

      # Encontrar todos os animais associados às consultas do veterinário
      @animais = @consultas.map(&:animal).uniq

      # Retorna os animais
      render json: @animais, status: :ok
    rescue => e
      render json: { error: "Erro ao buscar animais atendidos: #{e.message}" }, status: :internal_server_error
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_consulta
    @consulta = Consulta.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def consulta_params
    params.require(:consulta).permit(:funcionario_id, :animal_id, :data, :hora, :observacao)
  end

  def set_veterinario
    @funcionario = params[:funcionario]
  end

end
