class UsersController < ApplicationController
  def index
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @user = User.find(params[:id])
  end
end
