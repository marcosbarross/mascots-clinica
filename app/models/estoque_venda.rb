class EstoqueVenda < ApplicationRecord
    validates :estoque_vendas, :medicamento, :preco, :quantidade_disponivel, :quantidade_venda, :fornecedor, presence: true
end
