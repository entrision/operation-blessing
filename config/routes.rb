Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users

  root to: redirect("/users/sign_in")
end
