class InvoiceDetailsController < ApplicationController
  def index
    @invoice_details = InvoiceDetail.all
    render json: @invoice_details
  end

  def show
    @invoice_detail = InvoiceDetail.find(params[:id])
    render json: @invoice_detail
  end

  def create
    @invoice_detail = InvoiceDetail.create(
      invoice_id: params[:invoice_id],
      product_id: params[:product_id],
      price: params[:price],
      discount: params[:discount],
      quantity: params[:quantity]
    )
    render json: @invoice_detail
  end


  def update
    @invoice_detail = InvoiceDetail.find(params[:id])
    @invoice_detail.update(
      invoice_id: params[:invoice_id],
      product_id: params[:product_id],
      price: params[:price],
      discount: params[:discount],
      quantity: params[:quantity]
    )
    render json: @invoice_detail
  end

  def destroy
    @invoice_details = InvoiceDetail.all
    @invoice_detail = InvoiceDetail.find(params[:id])
    @invoice_detail.destroy
    render json: @invoice_details
  end
end
