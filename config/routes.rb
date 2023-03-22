Rails.application.routes.draw do
  # root 'home#index'

  devise_for :users
  devise_scope :user do
    root 'devise/sessions#new'
    get 'users',to: 'devise/registrations#new'
  end

  resources :user_pages, only: [:index] do 
    collection do
  # get '/user_pages', to: 'user_pages#index', as: 'user_pages' do
      resources :expenses
    end
  end
end
