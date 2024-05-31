Rails.application.routes.draw do
  # get 'books/new'
  # get 'books/show'
  # get 'books/edit'
  # get 'books' => 'books#index'
  resources :books
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
