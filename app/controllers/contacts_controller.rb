class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def create
    @contact = Contact.create(
      first_name: params[:first_name],
      second_name: params[:second_name],
      email: params[:email],
      phone: params[:phone],
      customer_id: params[:customer_id]

    )
    render json: @contact
  end


  def update
    @contact = Contact.find(params[:id])
    @contact.update(
      first_name: params[:first_name],
      second_name: params[:second_name],
      email: params[:email],
      phone: params[:phone]
    )
    render json: @contact
  end

  def destroy
    @contacts = Contact.all
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: @contacts
  end
end
