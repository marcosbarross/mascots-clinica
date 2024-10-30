class Funcionario < ApplicationRecord
    validates :nome, :contato, :cargo, :senha, presence: true
    validates :login, presence: true, uniqueness: true
end
