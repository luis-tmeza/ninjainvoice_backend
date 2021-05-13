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
    attributes_as_hash = entity_params.to_h
    invoice_details = attributes_as_hash.delete(:invoice_details)
    Invoice.transaction do
      invoice = Invoice.new(attributes_as_hash)
      invoice.save!
      invoice.reload
      invoice_details = invoice_details.map do |invoice_detail|
        invoice_detail[:invoice_id] = invoice.id
        invoice_detail
      end
      InvoiceDetail.insert_all!(invoice_details)
    end
    render json: @invoices
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.update(
      date: params[:date_invoice],
      date_due: params[:date_due],
      subtotal_invoice: params[:subtotal_invoice],
      total_invoice: params[:total_invoice],
      iva_invoice: params[:iva_invoice],
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

  def entity_params
    params.require(:invoice).permit(:id, :date_invoice, :date_due, :subtotal_invoice, :total_invoice, :iva_invoice, :customer_id, invoice_details: [ :invoice_id, :product_id, :price, :discount, :iva, :subtotal, :quantity])

  end
end
