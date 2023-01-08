Rails.application.routes.draw do
  root 'home#top'
  resources :posts, only: %i[index new create]
end
