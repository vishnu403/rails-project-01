class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users
  end

  def create
    @user = User.new(allowed_params)
    render :json => ( @user.save ? "created":" not created")
  end

  def update
    @user = User.find(params[:id])
    render :json => ( @user.update(allowed_params) ? "updated": "not updated")
  end

  def delete
    @user = User.find(params[:id])
    render :json => ( @user.destroy ? "deleted":" not deleted")
  end

  private
    def allowed_params
      params.require(:user).permit(:name, :age, :country, :phone_no)
    end
end
