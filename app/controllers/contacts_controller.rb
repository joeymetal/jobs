class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Obrigado pela sua mensagem. Nós entraremos em contato com você em breve!'
    else
      flash.now[:error] = 'Não é possível enviar a mensagem.'
      render :new
    end
  end

    

end
