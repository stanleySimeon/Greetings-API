Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      get 'messages', to: 'greetings#index'
      get 'messages/:id', to: 'greetings#show'
    end
  end
end
