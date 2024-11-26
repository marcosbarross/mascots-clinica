class Exame < ApplicationRecord
  belongs_to :consulta

    validates :consulta_id, presence: true
    validates :nome_exame, presence: true, length: { maximum: 100 }
    validates :status_exame, presence: true, inclusion: { in: %w[pendente concluído cancelado], 
                                                           message: "%{value} não é um status válido" }
end
