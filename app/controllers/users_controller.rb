# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  USER_PAGINATE_PER = 10

  def index
    @users = User.order([:created_at]).page(params[:page]).per(USER_PAGINATE_PER)
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
