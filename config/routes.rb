Rails.application.routes.draw do
  root 'welcome#index'

  delete '/logout' => 'sessions#destroy', :as => 'user_logout'

  get '/login' => 'sessions#new', :as => 'user_login'



  resources 'users' do
    collection do
      get 'calendar'
    end
  end

  resources 'sessions'


  post '/bills/:id/participate' => "bills#participate", :as => 'bill_participation'

  resources 'bills' do
    resources 'comments'
  end

  post '/events/:id/participate' => 'events#participate', :as => 'event_participation'

  resources 'events' do
    resources 'comments'
  end

  post '/chores/:id/participate' => "chores#participate", :as => 'chore_participation'

  resources 'chores' do
    resources 'comments'
  end





  get '/calendar', to: 'calendar#show'

end
