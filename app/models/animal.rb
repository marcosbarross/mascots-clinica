class Animal < ApplicationRecord
  belongs_to :tutor

  has_many :consultas

  validates :nome, :idade, :especie, :raca, :peso, presence: true

  validates :tutor_id, presence: true
end