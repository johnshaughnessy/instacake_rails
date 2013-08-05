class UsersController < ApplicationController
  def create
    user = User.find_or_create_by_uid_and_username(params[:user][:uid], params[:user][:username])
    if user.save
      render status: 200, json: { message: "User found or created.",
                                  user: user.to_json }
    else
      render status: 403, json: { message: "Unable to create user" }
    end
  end

  def add_to_project
    user = User.find_or_create_by_uid_and_username(params[:user_uid], params[:username])
    project = Project.find_by_uid(params[:project_uid]) 
    if project and user 
      assignment = Assignment.create
      assignment.user = user
      assignment.project = project
      if assignment.save
        render status: 200, json: { message: "User successfully added to project.",
                                    project: project.to_json,
                                    user: user.to_json,
                                    project_users: project.users.to_json }
      else
        render status: 403, json: { message: "Error saving assignment.",
                                    project: project.to_json,
                                    user: user.to_json }
      end
    else
      render status: 403, json: { message: "Error finding user or project from params." }
    end
  end

  def remove_from_project
    user = User.find_by_uid_and_username(params[:user_uid], params[:username])
    project = Project.find_by_uid(params[:project_uid]) 
    if project and user 
      assignment = Assignment.find_by_user_id_and_project_id(user.id, project.id)
      if assignment.destroy
        render status: 200, json: { message: "User removed from project.",
                                    project: project.to_json,
                                    user: user.to_json,
                                    project_users: project.users.to_json }
      else
        render status: 403, json: { message: "Error finding assignment.",
                                    project: project.to_json,
                                    user: user.to_json }
      end
    else
      render status: 403, json: { message: "Error finding user or project from params." }
    end
  end
end
