class Consulta < ApplicationRecord
  belongs_to :animal
  belongs_to :veterinario, class_name: 'Funcionario'

  validates :veterinario, :animal, :data, :hora, :observacao, presence: true
end
