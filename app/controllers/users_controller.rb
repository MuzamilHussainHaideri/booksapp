class UsersController < ApplicationController
  def edit
    @users = User.find(params[:id])
  end

  def index
    @users = User.order(created_at: :desc)
  end

  def update
    @users = User.find(params[:id])
    if @User.update(user_params)
      redirect_to user_url, notice: "User was  sucessfuly update "
    else
      redirect_to 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit({role_ids: []})
  end
end