class ProjectsController < ApplicationController
  def create 
    project = Project.create(params[:project])
    if project.save
      render status: 200, json: { message: "Created project: " + project.inspect }
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
        render status: 200, json: { message: "User " + user.inspect + " added to project " + project.inspect + " so that the project now has the following users: " + project.users.inspect }
      else
        render status: 403, json: { message: "Error saving assignment between " + user.inpect + " and " + project.inspect }
      end
    else
      render status: 403, json: { message: "Error finding user or project from params" }
    end
  end
end
