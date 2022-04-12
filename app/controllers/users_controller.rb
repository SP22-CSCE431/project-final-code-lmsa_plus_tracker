class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    # @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    user = User.find(params[:id])
    # if user.admin == true
    #   redirect_to :admin_root
    # else
    #   redirect_to :root
    # end
  end

  # GET /users/new
  # def new
  # @user = User.new
  # end

  # GET /users/1/edit
  def edit
    # puts("hecker")
  end

  def dev
    user = User.find(params[:id])
    if current_user.allowed
      user.update_attribute(:admin, true)
      redirect_to(:admin_root)
    end
  end

  def nodev
    user = User.find(params[:id])
    if current_user.allowed
      user.update_attribute(:admin, false)
      redirect_to(:root)
    end
  end

  def create_new_admin
    if current_user.admin == true
      user = User.find_by(email: params[:email])
      if user.present?
        user.update_attribute(:admin, true)
        redirect_to(:admin_root, notice: "New Admin Created Successfully")
      else
        redirect_to(:admin_root, alert: "The User Has to Sign In first, before assigning admin priviledges")
      end
    else 
      redirect_to(:root, alert: "You are not authorized!")
    end
  end

  # POST /users or /users.json
  # def create
  # @user = User.new(user_params)

  # respond_to do |format|
  # if @user.save
  # format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
  # format.json { render :show, status: :created, location: @user }
  # else
  # format.html { render :new, status: :unprocessable_entity }
  # format.json { render json: @user.errors, status: :unprocessable_entity }
  # end
  # end
  # end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    # respond_to do |format|
    # if @user.update(user_params)
    # format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
    # format.json { render :show, status: :ok, location: @user }
    # else
    # puts("pupper")
    # format.html { render :edit, status: :unprocessable_entity }
    # format.json { render json: @user.errors, status: :unprocessable_entity }
    # end
    # end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    # @user.destroy

    # respond_to do |format|
    # format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    # format.json { head :no_content }
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  #def set_user
    #@user = User.find(params[:id])
  #end

  ## Only allow a list of trusted parameters through.
  #def user_params
    #params.permit(:id, :major, :admin, :email, :first_name, :last_name, :bio, :birthdate, :major)
  #end
end
