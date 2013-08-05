class VideosController < ApplicationController
  def create
    user = User.find_by_uid(params[:user_uid])
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
    video = user.videos.find_or_create_by_uid_and_thumbnail_and_vid_uri(params[:video][:uid],
                                                                       params[:video][:thumbnail],
                                                                       params[:video][:vid_uri])
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

  def remove_from_project    
    user = User.find_by_uid(params[:user_uid])
    project = Project.find_by_uid(params[:project_uid])
    video = user.videos.find_by_uid(params[:video][:uid])
    vp = VpAssignment.find_by_project_id_and_video_id(project.id, video.id)

    if vp.destroy
      render status: 200, json: { message: "Video removed from project.",
                                  user: user.to_json,
                                  project: project.to_json,
                                  video: video.to_json }
    else
      render status: 403, json: { message: "Could not remove video." }
    end
  end
end
