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
end
