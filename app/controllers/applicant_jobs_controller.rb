class ApplicantJobsController < ApplicationController
  #before_action :search_job, only: [:create]
  before_action :set_applicant_job, only: [:show, :edit, :update, :destroy, :search_job]
  before_action :profile_complete, only: [:create, :new]
  respond_to :html

  def index
    @applicant_jobs = ApplicantJob.all
    respond_with(@applicant_jobs)
  end

  def show
    respond_with(@applicant_job)
  end

  def new
    @applicant_job = ApplicantJob.new
    respond_with(@applicant_job)
  end

  def edit
  end

  def create
  	@user = current_user
    @applicant_job = ApplicantJob.where(applicant_id: @user.applicant.id, job_id: applicant_job_params[:job_id]).limit(1)
       if @applicant_job.any?
          flash[:error] = 'Usuario ja cadastrado.'
          redirect_to jobs_path
       else

        @applicant_job = @user.applicant.applicant_jobs.build(applicant_job_params)

        @applicant_job.save
        
        redirect_to jobs_path
        #respond_with(@applicant_job)
       end
  end

  def update
    @applicant_job.update(applicant_job_params)
    respond_with(@applicant_job)
  end

  def destroy
    @applicant_job.destroy
    respond_with(@applicant_job)
  end

  def jobs_search
    @user = current_user
    @applicant_job = @user.applicant.applicant_jobs.build(applicant_job_params)
    @applicant_job.save
    respond_with(@applicant_job)
  end

  private
    def set_applicant_job
      @applicant_job = ApplicantJob.find(params[:id])
    end

    def search_job
        @user = current_user
      @applicant_job = ApplicantJob.where(applicant_id: @user.applicant.id, job_id: applicant_job_params[:job_id]).limit(1)
       if @applicant_job.empty?
          flash[:error] = 'Usuario ja cadastrado.'
          redirect_to jobs_path
       end
    end

    def profile_complete
     if current_user.applicant.nil?
        flash[:error] = 'Informações pessoais incompretas.'
        redirect_to jobs_path
     end
    end

    def applicant_job_params
      params.require(:applicant_job).permit(:applicant_id, :job_id)
    end
end
