class Admin::UsersController < ApplicationController
  before_action :ensure_user_is_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        puts "Update user successfully"
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user), notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        puts "@user #{@user.inspect} #{@user.errors.full_messages}"
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :title, :email, :address, :city, :state, :zip, :school, :years_in_practice, :role)
  end

  def ensure_user_is_admin
    redirect_to appointments_path unless current_user.admin?
  end
end
