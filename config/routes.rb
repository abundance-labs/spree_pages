Spree::Core::Engine.add_routes do
  namespace :admin, path: Spree.admin_path do
    resources :pages
  end

  constraints(Spree::SpreePages::RoutesConstraints) do
    get '/(*path)', to: 'pages#show', as: 'page'
  end
end
