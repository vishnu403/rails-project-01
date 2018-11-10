class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users
  end

  def create
    @user = User.new(allowed_params)
    render :json => ( @user.save ? @user:@user.errors)
  end

  def update
    @user = User.find(params[:id])
    render :json => ( @user.update(allowed_params) ? User.find(params[:id]) : @user.errors)
  end

  def delete
    @user = User.find(params[:id])
    @user = @user.destroy
    render :json => ( @user ? @user : "not deleted")
  end

  private
    def allowed_params
      params.require(:user).permit(:name, :age, :country, :phone_no)
    end
end
