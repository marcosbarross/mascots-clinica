class Tutor < ApplicationRecord
    has_many :Animal
    validates :nome, :endereco, presence: true
    validates :email, presence: true, uniqueness: true
  end
  