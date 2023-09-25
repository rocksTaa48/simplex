class UsersController < ApplicationController
  before_action :check_user

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def check_user
    render_error unless current_user.id == params[:id].to_i
  end
end
