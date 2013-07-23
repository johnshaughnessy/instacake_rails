class ProjectsController < ApplicationController

  def get_project
    project = Project.find_by_uid(params[:project_uid])
    if project
      render status: 200, json: { message: "Returning project details.",
                                  project: project.to_json,
                                  videos: project.videos.to_json,
                                  users: project.users.to_json }
    else
      render status: 403, json: { message: "Unable to locate project with uid: " + params[:project_uid] }
    end
  end

  def get_all_projects
    user = User.find_by_uid(params[:user_uid])
    if user
      render status: 200, json: { message: "Returning projects list",
                                  user: user.to_json,
                                  projects: user.projects.to_json }
    else
      render status: 403, json: { message: "Failed to locate user." }
    end
  end

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
                                    user: user.to_json,
                                    project: project.to_json }
      end
    else
      render status: 403, json: { message: "Error finding user or project from params." }
    end
  end

  def get_projects_list
    user = User.find_by_uid(params[:user_uid])
    if user
      render status: 200, json: { message: "Returning projects list",
                                  user: user.to_json,
                                  projects: user.projects.to_json }
    else
      render status: 403, json: { message: "Failed to locate user." }
    end
  end

  def get_videos_for_project
    project = Project.find_by_uid(params[:project_uid])
    if project
      render status: 200, json: { project: project.to_json,
                                  videos: project.videos.to_json }
    else
      render status: 403, json: { message: "Failed to find the project." }
    end
    
  end

  def get_users_for_project
    project = Project.find_by_uid(params[:project_uid])
    if project
      render status: 200, json: { project: project.to_json,
                                  videos: project.videos.to_json,
                                  users: project.users.to_json}
    else
      render status: 403, json: { message: "Failed to find the project." }
    end
  end

  def create_video_and_add_to_project
    user = User.find_by_uid(params[:user_uid])
    project = Project.find_by_uid(params[:project_uid])
    video = user.videos.find_or_create_by_uid(params[:video][:uid])
    vp_assignment = VpAssignment.create
    vp_assignment.video = video
    vp_assignment.project = project
    if vp_assignment.save
      render status: 200, json: { message: "Video saved and added to project.",
                                  user: user.to_json,
                                  project: project.to_json,
                                  video: video.to_json }
    else
      render status: 403, json: { message: "Could not save video." }
    end

  end
end
