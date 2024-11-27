class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  # Remove a verificação CSRF para evitar erros

  before_action :authenticate_user!, unless: :devise_controller?
end
