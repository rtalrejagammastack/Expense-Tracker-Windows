Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get 'users',to: 'devise/registrations#new'
  end

  get '/messages', to: 'messages#index', as: 'home'
  get 'expenses', to: 'home#expenses'
  get 'incomes', to: 'home#incomes'
  get 'calendar_view', to: 'home#calendar'
  get '/expense_categories', to: 'expense_categories#main'
  
  
  resources :user_categories, param: :slug do
    resources :expense_categories, param: :slug do
      resources :expense_sub_categories, param: :slug
    end
  end
  
  resources :messages
  # resources :transactions
  # resources :transactions
  # resources :expense_categories
end
