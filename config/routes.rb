Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root to: 'static_pages#home', as: :home
  end
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  get 'home', to: 'static_pages#home'
 

end
