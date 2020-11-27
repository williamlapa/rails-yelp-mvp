Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    # get '/restaurants/top', to: 'restaurants#top' as: :top_st

    # /restaurants/top - LINHAS SERVEM PARA LISTAR OS MELHORES rankings
    collection do
      # get '/top', to: 'restaurants#top'
      get :top
    end

    # SERVE PARA CATEGORIZAR POR CHEF
    member do
      get :category
    end

    # LINHA ABAIXO MOSTRA QUE QUE SÃO NESTED ROUTES
    resources :reviews, only: %i[new create]
  end

  resources :reviews, only: [:destroy]
end
