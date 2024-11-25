class User < ApplicationRecord
  # Inclua os módulos do Devise necessários para autenticação token-based
  include DeviseTokenAuth::Concerns::User
end
