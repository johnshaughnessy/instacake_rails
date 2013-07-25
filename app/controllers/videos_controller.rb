class VideosController < ApplicationController
  def create
    user = User.find_by_insta_id(params[:insta_id])
    video = user.videos.create(params[:video])
    if video.save
      render status: 200, json: { message: "Video saved.",
                                  user: user.to_json,
                                  video: video.to_json }
    else
      render status: 403, json: { message: "Failed to save video." }
    end    
  end

  def add_to_project    
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
