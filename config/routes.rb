Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/bloggers', to: 'bloggers#index', as: "bloggers"
  get '/bloggers/new', to: 'bloggers#new', as: "new_blogger"
  post '/bloggers', to: 'bloggers#create' 
  get '/bloggers/:id', to: 'bloggers#show', as: "blogger"

  get '/destinations/:id', to: 'destinations#show', as: "destination"

  get '/posts', to: 'posts#index', as: "posts"
  get '/posts/new', to: 'posts#new', as: "new_post"
  get '/posts/:id', to: 'posts#show', as: "post"
  post '/posts', to: 'posts#create'
  get '/posts/:id/edit', to: 'posts#edit', as: "edit_post"
  patch '/posts/:id', to: 'posts#update'
  patch '/posts/:id/likes', to: 'posts#likes', as: "likes_post"

end
