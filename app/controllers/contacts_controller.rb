class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. I will contact you soon!'
    else
      flash.now[:error] = 'Your message has not been sent.'
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end
