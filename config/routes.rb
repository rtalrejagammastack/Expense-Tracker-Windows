Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
    get 'users', to: 'devise/registrations#new'
  end
  
  get '/home', to: 'home#index'
  resources :expenses, only: [:index]
  resources :incomes, only: [:index]
  resources :calendars, only: [:index]
  resources :notifications, only: [:index]
  get '/expense_categories', to: 'expense_categories#all'
  resources :user_categories, param: :slug do
    resources :expense_categories, param: :slug do
      resources :expense_sub_categories, param: :slug
    end
  end
  resources :transactions, param: :slug do
    collection do
      get 'user_category/:slug', param: :slug, to: 'transactions#fetch_expense_categories'
      get 'expense_category/:slug', param: :slug, to: 'transactions#fetch_expense_sub_categories'
    end
  end
end

# transactions/user_category/:slug
# transactions/user_category/:user_category_slug/expense_category/:slug


# resources :transactions
# resources :expense_categories

# get '/messages', to: 'messages#index', as: 'home'
# get 'expenses', to: 'home#expenses'
# get 'incomes', to: 'home#incomes'
# get 'calendar_view', to: 'home#calendar'