class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(page: params[:page], per_page: 30).with_attached_images
  end

  def show
    @user = User.find(params[:id])
  end

  def update_image
    @user = User.find(params[:id])
    if @user.update(images: params[:user][:images])
      render json: 'User was successfully updated.'
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update_detail
    @user = User.find(params[:id])
    if @user.update(name: params[:user][:name], phone: params[:user][:phone])
      render json: 'User was successfully updated.'
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update_admin_fields
    @user = User.find(params[:id])
    if @user.update(is_admin: params[:is_admin], is_driver: params[:is_driver])
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      redirect_to users_path, notice: "User was not updated. #{@user.errors.full_messages.join(', ')}"
    end
  end

  def update_admin_fields_form
    @user = User.find(params[:id])
  end
end
