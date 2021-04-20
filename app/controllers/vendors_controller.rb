class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
    render json: @vendors
  end

  def show
    @vendor = Vendor.find(params[:id])
    render json: @contact
  end

  def create
    @vendor = Vendor.create(
      name: params[:name]
    )
    render json: @vendor
  end


  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(
      name: params[:name]
    )
    render json: @vendor
  end

  def destroy
    @vendors = Vendor.all
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    render json: @vendors
  end
end
