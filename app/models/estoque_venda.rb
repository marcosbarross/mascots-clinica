class EstoqueVenda < ApplicationRecord
    validates :medicamento, :preco, :quantidade_disponivel, :quantidade_venda, :fornecedor, presence: true
end
