Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :estoque_internamentos
  resources :internamentos
  resources :exames
  resources :prescricao_medicas
  resources :consultas
  resources :animals
  resources :estoque_vendas
  resources :tutors do
    get 'animals', on: :member # cria o endpoint /tutors/:id/animals
  end
  resources :funcionarios
  resources :cargos

  resources :animals do
    get 'consulta', on: :member # Cria a rota /animals/:id/consultations
  end

  resources :consultas do
    get 'veterinario/:id', on: :collection, action: 'by_veterinario'
    get 'by_animal/:animal_id', on: :collection, action: 'by_animal'
    get 'by_tutor/:tutor_id', on: :collection, action: 'by_tutor'
  end

  resources :consultas do
    get 'animais_atendidos/:funcionario_id', on: :collection, action: 'animais_atendidos'
  end

  patch '/vender_produto/:id', controller: 'funcionarios', action: 'vender_produto'
  patch '/adicionar_mais_estoque/:id', controller: 'funcionarios', action: 'adicionar_mais_estoque'

  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index"
end
