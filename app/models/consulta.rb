class Consulta < ApplicationRecord
  belongs_to :animal
  belongs_to :funcionario, class_name: 'Funcionario'

  validate :isVet

  private

  def isVet
    cargo = Cargo.find_by(nome_cargo: "Veterinário")
    if funcionario.nil? || funcionario.cargo_id != cargo.id
      errors.add(:funcionario, "deve ser um veterinário")
    end
  end  
end
