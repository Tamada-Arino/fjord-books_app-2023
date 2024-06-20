class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def index
    paginate_per = 10
    @users = User.order([:created_at]).page(params[:page]).per(paginate_per)
  end

  def show
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
end
