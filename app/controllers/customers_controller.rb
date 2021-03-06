class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    @customer = Customer.find(params[:id])
    render json: @customer
  end

  def search
  @customers = Customer.select(:name, :id, :email, :address, :cell_phone_number, :city).where('name LIKE ?', "%#{params['search_query']}%") unless params['search_query'].blank?
  render json: @customers
end

  def create
    @customer = Customer.create(
      name: params[:name],
      address: params[:address],
      city: params[:city],
      cell_phone_number: params[:cell_phone_number],
      email: params[:email]

    )
    render json: @customer
  end


  def update
    @customer = Customer.find(params[:id])
    @customer.update(
      name: params[:name],
      address: params[:address],
      city: params[:city],
      cell_phone_number: params[:cell_phone_number],
      email: params[:email]
    )
    render json: @customer
  end

  def destroy
    @customers = Customer.all
    @customer = Customer.find(params[:id])
    @customer.destroy
    render json: @customers
  end
end
