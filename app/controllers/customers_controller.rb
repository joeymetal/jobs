class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_user_type, only: [:index, :new, :create]
  load_and_authorize_resource
  
  respond_to :html

  def index
       # @user = current_user
          #if @user.customer(current_user.id?)
           # redirect_to edit_customer_path(@user.customer)
          #else
            @customers = Customer.all
            respond_with(@customers)
          #end 
  end

  def show
    respond_with(@customer)
  end

  def new
     
          @customer = Customer.new
          respond_with(@customer)
      
  end

  def edit
  end

  def create
    @user = current_user
     
    @customer = @user.build_customer(customer_params)
    @customer.save
    respond_with(@customer)
  
  end

  def update
    @customer.update(customer_params)
    respond_with(@customer)
  end

  def destroy
    @customer.destroy
    respond_with(@customer)
  end

  private
    def set_customer
      @customer = Customer.friendly.find(params[:id])
    end

    def find_user_type
      @user = current_user
      if @user.customer(current_user.id?)
            redirect_to edit_customer_path(@user.customer)
          elsif @user.applicant(current_user.id?)
              redirect_to edit_applicant_path(@user.applicant)
      end
    end
    def customer_params
      params.require(:customer).permit(:trading_name, :fancy_name, :cnpj, :commercial_activity, :foundation, :checked)
    end
end
