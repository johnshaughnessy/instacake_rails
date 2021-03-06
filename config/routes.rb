Instacake::Application.routes.draw do

  get  '/projects/get_project', to: 'projects#get_project'
  get  '/projects/get_all_projects', to: 'projects#get_all_projects'
  post '/projects/', to: 'projects#create'
  put  '/projects/change_title', to: 'projects#change_title'

  post '/users/', to: 'users#create'
  post '/users/add_to_project', to: 'users#add_to_project'
  put  '/users/remove_from_project', to: 'users#remove_from_project'

  post '/videos/add_to_project', to: 'videos#add_to_project'
  put  '/videos/remove_from_project', to: 'videos#remove_from_project'




  # post '/projects/create',                               to: 'projects#create'
  # post '/projects/add_user',                             to: 'projects#add_user'
  # post '/projects/get_projects_list',                    to: 'projects#get_projects_list'
  # post '/projects/get_videos_for_project',               to: 'projects#get_videos_for_project'
  # post '/projects/get_users_for_project',                to: 'projects#get_users_for_project'
  # post '/projects/create_video_and_add_to_project',      to: 'projects#create_video_and_add_to_project'

 
end
