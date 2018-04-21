Rails.application.routes.draw do
  devise_for :users
  root 'hosts#index'
  resources :users, only: [:show, :edit, :update] do
    member do
      post :edit_varification
    end
  end
  resources :hosts do
    collection do
      get 'search'
      get 'room'
      post 'bedrooms'
      post 'bathrooms'
      post 'location'
      post 'amenities'
    end
    member do
    # ステップ１
      get 'rooms'
      post 'bedrooms'
      post 'bathrooms'
      post 'location'
      post 'amenities'
    # ステップ２
      get 'photos'
      post 'description'
      post 'title'
    # ステップ３
      get 'guest-requirements'
      post 'house-rules'
      post 'review-guest-requirements'
      get 'review-how-guests-book'
      get 'keep-calendar-up-to-date'
      post 'availability-questions'
      post 'calendar'
      post 'price'
      post 'additional-pricing'
      get 'local-law'
    end
  end
  resources :categories, only: [] do
    resources :house_types, only: [:index, :show] do
    end
  end
end
