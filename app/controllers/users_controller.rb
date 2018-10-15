class UsersController < ApplicationController
  def view_all_users
      @all_users = User.all
  end

  def add_user_to_admin
      User.find(params[:id]).update(role: 'admin')
      redirect_back(fallback_location: all_users_path)
  end
end
