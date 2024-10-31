class PrescricaoMedica < ApplicationRecord
  belongs_to :consulta

  validates :consulta, :data, :medicamentos_prescritos, :dosagens, :observacao, presence: true
end
