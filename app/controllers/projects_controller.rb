class ProjectsController < ApplicationController
  def create 
    project = Project.create(params[:project])
    if project.save
      render status: 200, json: { message: "Project saved successfully",
                                  project: project.to_json }
    else
      render status: 403, json: { message: "Error creating project." }
    end
  end

  def add_user
    user = User.find_by_insta_id(params[:insta_id])
    project = Project.find_by_id(params[:project_id])
    if project and user 
      assignment = Assignment.create
      assignment.user = user
      assignment.project = project
      if assignment.save
        render status: 200, json: { message: "User successfully added to project.",
                                    user: user.to_json,
                                    project: project.to_json,
                                    project_users: project.users.to_json }
      else
        render status: 403, json: { message: "Error saving assignment between \n" + user.to_json + "\n and \n" + project.to_json }
      end
    else
      render status: 403, json: { message: "Error finding user or project from params" }
    end
  end
end
