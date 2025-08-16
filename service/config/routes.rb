Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root "homes#top"
  get "about" => "homes#about"
end
