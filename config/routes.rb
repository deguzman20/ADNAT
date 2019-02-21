Rails.application.routes.draw do
  
  namespace :dashboard do 
   
   resources :organization 
   get '/shifts/edit/:id', to: 'shifts#edit', as: :shift_edit
   post '/shifts/edit/:id', to: 'shifts#update', as: :shift_updates
   get '/organization/join/join_organization', to: 'organization#join_organization'
   
   resources :shifts
   post 'organization/:id/edit', to: 'organization#update' 
   get 'organization/:id/edit', to: 'organization#update' 
   get  'organization/:id/edit_origanization', to: 'organization#edit_organization', as: :edit_organization
   post  'update_organization', to: 'organization#update_organization', as: :update_organization
  end
  devise_for :users, controllers: {
    :registrations => "users/registrations",
    :sessions => "users/sessions"
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
