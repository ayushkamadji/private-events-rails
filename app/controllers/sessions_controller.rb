class SessionsController < ApplicationController
  before_action :find_user, only: [:create, :destoy]

  def new
  end

  def create
    if @user
      sign_in(@user)
      redirect_to @user
    else
      flash.now[:danger] = "Email not registered"
      render :new
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to sign_in_path
  end


  private


    def find_user
      email = signed_in? ?
              current_user.email :
              params[:session][:email]
      @user = User.find_by(email: email)
    end
end
