class EstoqueVendasController < ApplicationController
  before_action :set_estoque_venda, only: %i[ show update destroy ]

  # GET /estoque_vendas or /estoque_vendas.json
  def index
    @estoque_vendas = EstoqueVenda.all
    render json: @estoque_vendas
  end

  # GET /estoque_vendas/1 or /estoque_vendas/1.json
  def show
    render json: @estoque_venda
  end

  # POST /estoque_vendas or /estoque_vendas.json
  def create
    @estoque_venda = EstoqueVenda.new(estoque_venda_params)
    if @estoque_venda.quantidade_venda == nil
      @estoque_venda.quantidade_venda = 0
    end
    if @estoque_venda.save
      render json: @estoque_venda, status: :created, location: @estoque_venda
    else
      render json: @estoque_venda.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estoque_vendas/1 or /estoque_vendas/1.json
  def update
    if @estoque_venda.update(estoque_venda_params)
      render json: @estoque_venda, status: :ok, location: @estoque_venda
    else
      render json: @estoque_venda.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estoque_vendas/1 or /estoque_vendas/1.json
  def destroy
    @estoque_venda.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_estoque_venda
    @estoque_venda = EstoqueVenda.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def estoque_venda_params
    params.require(:estoque_venda).permit(:medicamento, :preco, :quantidade_disponivel, :quantidade_venda, :fornecedor)
  end
end