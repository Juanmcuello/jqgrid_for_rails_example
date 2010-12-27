class InvoicesController < ApplicationController

  # GET /invoices
  def index

    @columns = ['invid', 'invdate', 'amount', 'tax', 'total', 'note']

    order = "#{params[:sidx]} #{params[:sord]}"

    @invoices = Invoice.paginate(
      :page => params[:page],
      :per_page => params[:rows],
      :order => (order unless order.blank?))

    if request.xhr?
      json = json_for_jqgrid(@invoices, @columns, {:page => params[:page]})
      render :json => json
    end

  end

end
