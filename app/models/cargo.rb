class Cargo < ApplicationRecord
    validates :nome_cargo, presence: true
end