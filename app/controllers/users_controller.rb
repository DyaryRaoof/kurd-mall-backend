class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).paginate(page: params[:page], per_page: 30).with_attached_images
  end

  def show
    @user = User.find(params[:id])
  end
end
