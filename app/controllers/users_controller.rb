class UsersController < ApplicationController
  layout "application"

  load_and_authorize_resource

  before_action :set_user, only: %i[index show edit update destroy]

  def index
    # @users = User.all
    @users = User.where.not(role: "admin")
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.welcome_email(@user).deliver_now
      flash[:notice] = "User created successfully."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @tmp_user = User.find(params[:id])
    # puts "**debug** This is edit and tmp_user: #{@tmp_user.name}"
  end

  def update
    @tmp_user = User.find(params[:id])
    # puts "**debug** This is update and tmp_user: #{@tmp_user.name}"
    if @tmp_user.update(user_params)
      flash[:notice] = "User updated successfully."
      redirect_to user_path
    else
      flash.now[:alert] = "Empty/Invalid fields!"
      render :edit
    end
  end

  def delete
  end

  def destroy
    @user.destroy
    flash[:notice] = "User destroyed successfully."
    redirect_to root_path
  end

  def confirm
    # print "## token: #{params[:token]}"
    @user = User.find_by(confirmation_token: params[:token])
    if @user && @user.confirmed_at.nil?
      @user.update(confirmed_at: Time.now, confirmation_token: nil)
      redirect_to @user, notice: "Your email has been confirmed successfully!"
    else
      redirect_to root_path, alert: "Invalid confirmation token or email already confirmed."
    end
  end

  def login
  end

  def become_teacher
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :date_joined, :bio, :role, :profile_picture, student_certificates: [], teacher_certificates: [])
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
    @tmp_user = @user
  end
end
