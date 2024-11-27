class Funcionario < ApplicationRecord
  belongs_to :cargo
  belongs_to :user, optional: true

  validates :nome, :contato, :cargo, :senha, presence: true
  validates :login, presence: true, uniqueness: true
end
