Rails.application.routes.draw do
  # Usando Devise Token Auth para autenticação via token
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :estoque_internamentos
  resources :internamentos
  resources :prescricao_medicas
  resources :estoque_vendas
  resources :animals
  resources :funcionarios
  resources :cargos
  resources :consultas

  resources :tutors do
    get 'animals', on: :member
  end
  # Rotas personalizadas para ações específicas
  patch '/vender_produto/:id', controller: 'funcionarios', action: 'vender_produto'
  patch '/adicionar_mais_estoque/:id', controller: 'funcionarios', action: 'adicionar_mais_estoque'

  # Rota de health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Definição da raiz da aplicação (caso necessário)
  # root "posts#index"
end
