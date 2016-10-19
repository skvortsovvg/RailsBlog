class ContactsController < ApplicationController
  
  def new
    
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.valid? then
      @contact.save
    else
      render action: 'new'
    end
    #render(plain: params.inspect)
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :msg)
  end

end
