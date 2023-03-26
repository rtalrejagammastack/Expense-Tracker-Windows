Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get 'users',to: 'devise/registrations#new'
  end

  get 'home', to: 'home#index'
  get 'expenses', to: 'home#expenses'
  get 'incomes', to: 'home#incomes'
  get 'calendar_view', to: 'home#calendar'
  
  resources :categories
  
  resources :transactions

end
