class Consulta < ApplicationRecord
  belongs_to :animal
  
  belongs_to :veterinario, class_name: 'Funcionario'

  validates :veterinario, :data, :hora, presence: true
end
