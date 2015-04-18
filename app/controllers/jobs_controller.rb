class JobsController < ApplicationController
  #before_action :set_job, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  #before_action :authenticate_user!
  #load_and_authorize_resource #:except => [:show, :index, :featured]
  
  #attr_accessor  :slug, :all
  #skip_authorize_resource :only => [:show, :index, :featured, :manifest]


  before_action :set_job, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, :except => [:index, :featured]
  #before_filter :authenticate_user!, :except => [:show, :index, :featured]
  load_and_authorize_resource :except => [:show, :index, :featured], param_method: :job_params
  skip_authorize_resource :only => [:index, :featured, :job, :result]
  attr_accessor :user_id, :all

  respond_to :html

  def index
    #@jobs = Job.order(:title).page params[:page]
    @jobs = Job.page(params[:page]).per(6)
    #@applicant_job  = ApplicantJob.count(:job_id) #total de escritos 
    #if @applicant_job.any?
     # @applicant_job =1
   # end
   # @applicant_job  = ApplicantJob.all 
    @applicant_job  = ApplicantJob.count(:job_id)
    respond_with(@jobs, @applicant_job)
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
  end

  def create
    #authorize! :create, @model
    @user = current_user
    @job = @user.customer.jobs.build(job_params)
    @job.save
    respond_with(@job)
  end

  def update
    @job.update(job_params)
    respond_with(@job)
  end

  def destroy
    @job.destroy
    respond_with(@job)
  end

  def search 
    
  end 

  def result
    @jobs = Job.page(params[:page]).per(6).search(params[:query])
    if @jobs.empty?
      flash[:error] = 'Não foi encontrado nenhum resultado.'
          redirect_to jobs_path
    else 
      respond_with (@jobs)
    end
    
  end
  
  def featured
     @jobs = Job.page(params[:page]).per(6).where({"featured" => true}) 
      if @jobs.empty?
          flash[:error] = 'Não foram encontradas nenhuma vaga em destaque.'
          redirect_to jobs_path
        else
           respond_with(@jobs)
      end
  end

  def job    
    @user = current_user
    @job = @user.applicant.build(job_params)
    @job.save
    respond_with(@job)
  end

  private

    def set_job
      @job = Job.friendly.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :vacancies, :salary, :expiration, :description, :current_user, :featured, :slug,:customer_id, :applicant_id, :jod_id)
    end
end
