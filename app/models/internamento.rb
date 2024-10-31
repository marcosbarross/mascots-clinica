class Internamento < ApplicationRecord
  belongs_to :consulta

  validates :data_inicio, :data_fim, :medicamento, :quantidade_medicamento, :obs_monitoramento, presence: true
end
