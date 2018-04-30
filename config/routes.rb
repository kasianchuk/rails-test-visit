Rails.application.routes.draw do
  root 'welcome#index'
  resources :welcome, only: [:index]  do
    collection {post :import}
  end
end
