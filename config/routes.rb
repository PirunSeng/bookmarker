Rails.application.routes.draw do

  devise_for :users
  root 'finders#index'

  resources :finders
  resources :categories, except: [:show, :index]

  get '/rubyonrails' => 'finders#rubyonrails'
  get '/jquery' => 'finders#jquery'

  resources :users

end
