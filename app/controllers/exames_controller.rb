class ExamesController < ApplicationController
  before_action :set_exame, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token

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

  # GET /exames/by_consulta/:consulta_id
  def by_consulta
    @exames = Exame.where(consulta_id: params[:consulta_id])
    render json: @exames, status: :ok
  end

  # GET /exames/by_animal/:animal_id
  def by_animal
    @consultas = Consulta.where(animal_id: params[:animal_id])
    @exames = Exame.where(consulta_id: @consultas.pluck(:id))
    render json: @exames, status: :ok
  end

  # GET /exames/by_funcionario/:funcionario_id
  def by_funcionario
    @consultas = Consulta.where(funcionario_id: params[:funcionario_id])
    @exames = Exame.where(consulta_id: @consultas.pluck(:id))
    render json: @exames, status: :ok
  end

  # GET /exames/by_tutor/:tutor_id
  def by_tutor
    begin
      # Animais associados ao tutor
      @animals = Animal.where(tutor_id: params[:tutor_id])

      # Consultas associadas aos animais do tutor
      @consultas = Consulta.where(animal_id: @animals.pluck(:id))

      # Exames associados às consultas
      @exames = Exame.where(consulta_id: @consultas.pluck(:id))
      render json: @exames, status: :ok
    rescue => e
      render json: { error: "Erro ao buscar exames do tutor: #{e.message}" }, status: :internal_server_error
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def exame_params
    params.require(:exame).permit(:consulta_id, :nome_exame, :status_exame, :resultado)
  end
end
