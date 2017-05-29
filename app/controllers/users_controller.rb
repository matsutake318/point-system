class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :followings, :followers]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録完了しました"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def pointview
    @user = User.find(params[:id])
    @saves = @user.saves
    @spends = @user.spends
    @totalpoint = 0
    @saves.each do |s|
         @totalpoint += s.point
    end
    @spends.each do |sp|
         @totalpoint -= sp.point
    end
  end
  
  def pointspend
    @user = User.find(params[:id])
    @spend = @user.spends.build
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Update profile"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

 

  private

  def user_params
    params.require(:user).permit(:number, :password,
                                 :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path if current_user != @user
  end
end