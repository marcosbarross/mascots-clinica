class Exame < ApplicationRecord
  belongs_to :consulta

  validates :exames, :consulta, :nome_exame, :status_exame, :resultado, presence: true
end
