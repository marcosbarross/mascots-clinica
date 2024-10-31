class EstoqueInternamentosController < ApplicationController
  before_action :set_estoque_internamento, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /estoque_internamentos or /estoque_internamentos.json
  def index
    @estoque_internamentos = EstoqueInternamento.all
    render json: @estoque_internamentos
  end

  # GET /estoque_internamentos/1 or /estoque_internamentos/1.json
  def show
    render json: @estoque_internamento
  end

  # POST /estoque_internamentos or /estoque_internamentos.json
  def create
    @estoque_internamento = EstoqueInternamento.new(estoque_internamento_params)
    if @estoque_internamento.save
      render json: @estoque_internamento, status: :created, location: @estoque_internamento
    else
      render json: @estoque_internamento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estoque_internamentos/1 or /estoque_internamentos/1.json
  def update
    if @estoque_internamento.update(estoque_internamento_params)
      render json: @estoque_internamento, status: :ok, location: @estoque_internamento
    else
      render json: @estoque_internamento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estoque_internamentos/1 or /estoque_internamentos/1.json
  def destroy
    @estoque_internamento.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_estoque_internamento
    @estoque_internamento = EstoqueInternamento.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def estoque_internamento_params
    params.require(:estoque_internamento).permit(:solicitacao_internamento_id, :medicamento, :quantidade_disponivel, :quantidade_utilizada, :quantidade_minima, :fornecedor)
  end
end
