Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'
  get '/about' => 'home#about', :as => :about

  get '/organizations/search' => 'organizations#search', :as => :search
  get '/organizations/ajax_edit' => 'organizations#ajax_edit', :as => :ajax_edit
  resources :organizations

  get '/:id' => 'organizations#show', :as => :organization_shortcut

end
