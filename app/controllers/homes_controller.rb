class HomesController < ApplicationController

  def index; end

  def contact_us
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_us_path, notice: 'Contact was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def about; end

  def services; end

  private
    def contact_params
      params.require(:contact).permit(:name, :phone, :email, :message)
    end

end
