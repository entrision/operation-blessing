Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root to: redirect("/users/sign_in")

  namespace :api do
    namespace :v1 do
      resources :photos, except: [:destroy]
    end
  end
end
