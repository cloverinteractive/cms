class Dashboard::UsersController < ApplicationController
  set_tab :list_users, only: :index

  def index
    @users = User.order('username').page params[:page]
  end

  def destroy
    @user = User.find params[:id]

    @user.destroy
    redirect_to dashboard_users_path
  end
end
