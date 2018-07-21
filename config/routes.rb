Rails.application.routes.draw do
  get "/" => "posts#top"
  get "posts/:id" => "posts#edit"
  get "posts/:id/move" => "posts#move"

  post "posts/create" => "posts#create"
  post "posts/:id/rewrite" => "posts#rewrite"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
