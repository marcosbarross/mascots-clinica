class Tutor < ApplicationRecord
    has_many :animals
    validates :nome, :endereco, presence: true
    validates :email, presence: true, uniqueness: true
  end
  