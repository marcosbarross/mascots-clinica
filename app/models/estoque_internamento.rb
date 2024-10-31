class EstoqueInternamento < ApplicationRecord
  belongs_to :internamento

  validates :medicamento, :quantidade_disponivel, :quantidade_utilizada, :quantidade_minima, :fornecedor, presence: true
end
