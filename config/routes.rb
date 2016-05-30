Rails.application.routes.draw do
  root 'welcome#home'

  resources :products do
    resources :user_stories
    resources :sprint_backlogs
  end
  resources :developments, only: [:index] do
    member do
      get 'information'
    end
  end
  resources :tasks

end
