Instacake::Application.routes.draw do
  post '/projects/create', to: 'projects#create'
  post '/projects/add_user', to: 'projects#add_user'
end