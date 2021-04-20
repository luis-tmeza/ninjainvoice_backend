class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
    render json: @invoices
  end

  def show
    @invoice = Invoice.find(params[:id])
    render json: @invoice
  end

  def create
    @invoice = Invoice.create(
      date: params[:date],
      consecutive: params[:consecutive],
      subtotal: params[:subtotal],
      total: params[:total],
      discount: params[:discount],
      discount_amount: params[:discount_amount],
      customers_id: params[:customers_id]

    )
    render json: @invoice
  end


  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(
      date: params[:date],
      consecutive: params[:consecutive],
      subtotal: params[:subtotal],
      total: params[:total],
      discount: params[:discount],
      discount_amount: params[:discount_amount],
      customers_id: params[:customers_id]
    )
    render json: @invoice
  end

  def destroy
    @invoices = Invoice.all
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    render json: @invoices
  end
end
