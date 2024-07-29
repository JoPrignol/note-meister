Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :subjects
  # les tags sont nestés dans les posts pour plus de clarté et pour éventuellement pouvoir
  # les créer en même temps que les posts
  resources :posts do
    resources :tags
  end

  root "posts#index"
end
