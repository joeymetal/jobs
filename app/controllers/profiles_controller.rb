class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :find_user_type, only: [:new, :create]
  #before_action :authenticate_user!
  load_and_authorize_resource
  
  #attr_accessor :all
  skip_authorize_resource :only => [:show, :index]

  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    respond_with(@profile)
  end

  def new
   
    @profile = Profile.new
    respond_with(@profile)
   
  end

  def edit
  end

  def create
    @user = current_user
    @profile = @user.applicant.build_profile(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def find_user_type
      @user = current_user
      #@profile = Profile.find(params[:applicant_id])
      if @user.profile(current_user.id?) 
            redirect_to edit_profile_path(@user.profile)
      end

      #@user Profile.where("applicant_id = ?", current_user.id)
       
    end

    def profile_params
      params.require(:profile).permit(:applicant_id, :skills, :objectives, :formations, :professional_experiences, :qualifications, :additional_informations, :current_user, :all)
    end
end
