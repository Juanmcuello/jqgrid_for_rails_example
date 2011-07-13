class InvoicesController < ApplicationController

  # GET /invoices
  def index

    @columns = ['invid', 'invdate', 'amount', 'tax', 'total', 'note']

    @invoices = Invoice.paginate(
      :page     => params[:page],
      :per_page => params[:rows],
      :order    => order_by_from_params(params))

    if request.xhr?
      render :json => json_for_jqgrid(@invoices, @columns)
    end

  end

 def update
    @invoice = Invoice.find_by_id(params[:id])
    @invoice.update_attributes({:amount => params[:amount]})

    if request.xhr?
      render :json => @invoice
    end
 end
end
