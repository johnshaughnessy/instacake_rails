class UsersController < ApplicationController
  def create
    user = User.find_or_create_by_uid_and_username(params[:user][:uid], params[:user][:username])
    if user.save
      render status: 200, json: { message: "User created: \n" + user.inspect }
    else
      render status: 403, json: { message: "Unable to create user" }
    end
  end
end
