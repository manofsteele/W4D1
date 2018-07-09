class UsersController < ApplicationController
  
  def index 
    # render plain: "Hello! I'm in the Index action"
    @users = User.all 
    if @users 
      render json: @users 
    end
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user  
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    user = User.find(params[:id])  
    if user 
      render json: user 
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params) 
      render json: user, status: 201
    else
      render json: user.errors.full_messages, status: 422
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: @user, status: 200
    else
      render json: @user.errors.full_messages, status: 422
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end