require 'test_helper'

class ApplicantJobsControllerTest < ActionController::TestCase
  setup do
    @applicant_job = applicant_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applicant_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create applicant_job" do
    assert_difference('ApplicantJob.count') do
      post :create, applicant_job: { applicant_id: @applicant_job.applicant_id, job_id: @applicant_job.job_id }
    end

    assert_redirected_to applicant_job_path(assigns(:applicant_job))
  end

  test "should show applicant_job" do
    get :show, id: @applicant_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @applicant_job
    assert_response :success
  end

  test "should update applicant_job" do
    patch :update, id: @applicant_job, applicant_job: { applicant_id: @applicant_job.applicant_id, job_id: @applicant_job.job_id }
    assert_redirected_to applicant_job_path(assigns(:applicant_job))
  end

  test "should destroy applicant_job" do
    assert_difference('ApplicantJob.count', -1) do
      delete :destroy, id: @applicant_job
    end

    assert_redirected_to applicant_jobs_path
  end
end
