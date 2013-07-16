class UsersController < ApplicationController
  def create
    user = User.create(params[:user])
    if user.save
      render status: 200, json: { message: "User created: " + user.inspect }
    else
      render status: 403, json: { message: "Unable to create user" }
    end
  end
end
