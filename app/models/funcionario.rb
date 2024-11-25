class Funcionario < ApplicationRecord
    belongs_to :cargo
    
    validates :nome, :contato, :cargo, :senha, presence: true
    validates :login, presence: true, uniqueness: true
  end
  