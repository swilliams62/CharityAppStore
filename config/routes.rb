Sema::Application.routes.draw do
  get 'donate' => 'donations#new'
  resources :donations
  get '/blog', to: redirect('http://blog.semadevelopment.com')
  get '/community', to: redirect('https://plus.google.com/communities/108940481083960390713')
  get '/:id' => 'high_voltage/pages#show', as: :static, via: :get
  root to: 'home#index'
end
