class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /funcionarios or /funcionarios.json
  def index
    @funcionarios = Funcionario.all
    render json: @funcionarios
  end

  # GET /funcionarios/1 or /funcionarios/1.json
  def show
    render json: @funcionario
  end

  # POST /funcionarios or /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)
    if @funcionario.save
      render json: @funcionario, status: :created, location: @funcionario
    else
      render json: @funcionario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  def update
    if @funcionario.update(funcionario_params)
      render json: @funcionario, status: :ok, location: @funcionario
    else
      render json: @funcionario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  def destroy
    @funcionario.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_funcionario
    @funcionario = Funcionario.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def funcionario_params
    params.require(:funcionario).permit(:nome, :contato, :cargo, :login, :senha)
  end
end
