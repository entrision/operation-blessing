Rails.application.routes.draw do
  devise_for :users
  # devise_for :users do
  #   root 'devise/sessions#new'
  # end
end
