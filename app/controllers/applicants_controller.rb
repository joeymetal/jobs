class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_user_type, only: [:new, :create]
  load_and_authorize_resource
  
  respond_to :html

  def index
    @applicants = Applicant.all
    respond_with(@applicants)
  end

  def show
    respond_with(@applicant)
  end

  def new 
          @applicant = Applicant.new
          respond_with(@applicant)
  end

  def edit
  end

  def create
     @user = current_user
      @applicant = @user.build_applicant(applicant_params)
      @applicant.save
      respond_with(@applicant)
     
  end

  def update
    @applicant.update(applicant_params)
    respond_with(@applicant)
  end

  def destroy
    @applicant.destroy
    respond_with(@applicant)
  end

  def manifest
      @user = current_user
      @applicant = @user.jobs.build(applicant_params)
      @applicant.saves
  end


  private

    
    def set_applicant
      @applicant = Applicant.friendly.find(params[:id])
    end

    def find_user_type
      @user = current_user
      if @user.customer(current_user.id?)
            redirect_to edit_customer_path(@user.customer)
          elsif @user.applicant(current_user.id?)
              redirect_to edit_applicant_path(@user.applicant)
      end
    end
    def applicant_params
      params.require(:applicant).permit(:first_name, :last_name, :cpf, :rg, :birthday, :sex, :applicant_id, :job_id)
    end
end
