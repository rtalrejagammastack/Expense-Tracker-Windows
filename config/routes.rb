Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get 'users',to: 'devise/registrations#new'
  end

  get 'home', to: 'home#index'
  get '/messages', to: 'messages#index'
  get 'expenses', to: 'home#expenses'
  get 'incomes', to: 'home#incomes'
  get 'calendar_view', to: 'home#calendar'
  get '/expense_categories', to: 'expense_categories#index'
  
  # resources :messages

  resources :categories do
    # resources :transactions
    resources :expense_categories do
      resources :expense_sub_categories
    end
  end

  # resources :transactions
  resources :expense_categories
end
