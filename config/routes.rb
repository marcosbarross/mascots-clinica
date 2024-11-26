Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :estoque_internamentos
  resources :internamentos
  resources :prescricao_medicas
  resources :estoque_vendas
  resources :tutors do
    get 'animals', on: :member
  end
  resources :funcionarios
  resources :cargos

  resources :exames do
    get 'by_consulta/:consulta_id', on: :collection, action: 'by_consulta'
    get 'by_animal/:animal_id', on: :collection, action: 'by_animal'
    get 'by_funcionario/:funcionario_id', on: :collection, action: 'by_funcionario'
    get 'by_tutor/:tutor_id', on: :collection, action: 'by_tutor'
  end

  resources :animals do
    get 'consulta', on: :member
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
