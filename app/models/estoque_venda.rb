class EstoqueVenda < ApplicationRecord
    validates :medicamento, :preco, :quantidade_disponivel, :fornecedor, presence: true

    def retira_n_estoque quantidade_a_retirar
        if self.quantidade_disponivel < quantidade_a_retirar
            return false
        else
            self.quantidade_disponivel -= quantidade_a_retirar
            self.save
        end
    end
end
