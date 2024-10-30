class Animal < ApplicationRecord
  belongs_to :tutor

  validates :nome, :idade, :especie, :raca, :peso, presence: true

  validates :tutor_id, presence: true
end