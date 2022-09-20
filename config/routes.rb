Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'messages', to: 'greetings#index'
      get 'messages/:id', to: 'greetings#show'
      post 'messages', to: 'greetings#create'
      put 'messages/:id', to: 'greetings#update'
      delete 'messages/:id', to: 'greetings#destroy'
    end
  end
end
