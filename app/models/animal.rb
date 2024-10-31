class Animal < ApplicationRecord
  belongs_to :tutor

  validates :nome, :idade, :especie, :raca, :peso, :tutor_id, presence: true
end