Rails.application.routes.draw do
  resources :games, only: [:index, :create, :show] do
    resources :moves, only: [:create, :show], shallow: true
  end
end
