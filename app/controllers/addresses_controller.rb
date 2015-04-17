class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  before_action :find_user_type, only: [:new, :create]
  load_and_authorize_resource
  
  respond_to :html

  def index
    @addresses = Address.all
    respond_with(@addresses)
  end

  def show
    respond_with(@address)
  end

  def new
    @address = Address.new
    respond_with(@address)
  end

  def edit
  end

  def create
    @user = current_user
    @address = @user.build_address(address_params)
    @address.save
    respond_with(@address)
  end

  def update
    @address.update(address_params)
    respond_with(@address)
  end

  def destroy
    @address.destroy
    respond_with(@address)
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def find_user_type
      @user = current_user
      if @user.address(current_user.id?) 
            redirect_to edit_address_path(@user.address)
      end      
    end

    def address_params
      params.require(:address).permit(:street, :neighborhood, :city, :state, :cep, :number)
    end
end
