class ProfilesController < ApplicationController
  load_and_authorize_resource
  before_action :set_current_user_profile, only: [:edit, :update, :destroy]
  before_action :set_profile, only: [:show]

  # GET /profiles
  # GET /profiles.json
  def index
    # @profiles = Profile.find(current_user.id)
    # @profiles = User.find(current_user.id).profile
    # @profiles = (current_user.blank? ? Profile.all : Profile.find(:all, :conditions => ["user_id != ?", current_user.id]))
    @profiles = Profile.all.count > 1 ? (Profile.find(:all, :conditions => ["user_id != ?", current_user.id])) : []
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @user = User.find(current_user.id)
    @own_profile = @profile.user_id == current_user.id ? true : false
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    technologies = Technology.where(id: params[:profile][:technologies].compact)
    @profile.technologies = []
    technologies.each do |technology|
      @profile.technologies << technology
    end

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_user_profile
      @profile = Profile.find_by_user_id(current_user.id)
    end
    def set_profile
      @profile = !params[:id].blank? ? Profile.find(params[:id]) : Profile.find_by_user_id(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :pool, :location, :contact, :about_me )
      # params.require(:profile).permit(:first_name, :last_name, :pool, :location, :contact, :about_me, :technologies )
      # params.require(:profile).permit(:first_name, :last_name, :pool, :location, :contact, :about_me ).merge({technologies: []}
    end
end
