class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]
 # before_action :authenticate_user!
  before_action :find_user_type, only: [:new, :create]
  load_and_authorize_resource
  
  respond_to :html

  def index
    @phones = Phone.all
    respond_with(@phones)
  end

  def show
    respond_with(@phone)
  end

  def new
    @phone = Phone.new
    respond_with(@phone)
  end

  def edit
  end

  def create
    @user = current_user
    @phone = @user.build_phone(phone_params)
    @phone.save
    respond_with(@phone)
  end

  def update
    @phone.update(phone_params)
    respond_with(@phone)
  end

  def destroy
    @phone.destroy
    respond_with(@phone)
  end

  private
    def set_phone
      @phone = Phone.find(params[:id])
    end

    def find_user_type
      @user = current_user
      if @user.phone(current_user.id?) 
            redirect_to edit_phone_path(@user.phone)
      end      
    end

    def phone_params
      params.require(:phone).permit(:tel, :cel, :others, :observations, :all, :current_user, :user_id)
    end
end
