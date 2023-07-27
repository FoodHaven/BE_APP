class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end