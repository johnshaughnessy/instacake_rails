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
    user = User.find_by_insta_id(params[:user_insta_id])
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

  def get_projects_list
    user = User.find_by_insta_id(params[:insta_id])
    render status: 200, json: { user: user.to_json,
                                projects: user.projects.to_json }
  end

  def get_videos_for_project
    project = Project.find_by_id(params[:id])
    render status: 200, json: { project: project.to_json,
                                videos: project.videos.to_json }
  end

  def create_video_and_add_to_project
    user = User.find_by_insta_id(params[:insta_user_id])
    project = Project.find_by_id(params[:project_id])
    video = user.create(params[:video])
    if video.save

    else
      render status: 403, json: { message: "Could not save video." }
    end

  end
end
