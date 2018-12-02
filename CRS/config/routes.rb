Rails.application.routes.draw do
  resources :post_attachments
  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :rent_posts
  root to: 'rent_posts#index'
  
  resources :users, only: [:show] do 
    post 'follow', to: 'users#follow', as: :follow, on: :member
  end
  
  #유저 페이지 user page
  get 'users/:id', to: 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #렌트댓글 Rent_Comment
    #Create
    post '/rent_comments' => 'rent_comments#create'
    #destroy
    delete '/rent_comments/:id' => 'rent_comments#destroy' 

end 
