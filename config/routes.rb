Rails.application.routes.draw do
  # Usando Devise Token Auth para autenticação via token
  mount_devise_token_auth_for 'User', at: 'auth'

  # Remover o `devise_for :users` para evitar conflito com o Devise Token Auth
  # Não é necessário se você estiver usando o Devise Token Auth para autenticação de usuário

  # Recursos principais
  resources :estoque_internamentos
  resources :internamentos
  resources :exames
  resources :prescricao_medicas
  resources :consultas
  resources :animals
  resources :estoque_vendas

  # Recursos de tutores e animais associados
  resources :tutors do
    get 'animals', on: :member # Cria o endpoint /tutors/:id/animals
  end

  # Recursos de funcionários e cargos
  resources :funcionarios
  resources :cargos

  # Rotas personalizadas para ações específicas
  patch '/vender_produto/:id', controller: 'funcionarios', action: 'vender_produto'
  patch '/adicionar_mais_estoque/:id', controller: 'funcionarios', action: 'adicionar_mais_estoque'

  # Rota de health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Definição da raiz da aplicação (caso necessário)
  # root "posts#index"
end
