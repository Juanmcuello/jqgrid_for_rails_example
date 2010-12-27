module InvoicesHelper

  include JqgridsHelper 

  def invoices_jqgrid

    options = {:on_document_ready => true, :html_tags => false}

    grid_options = {
      :url => '/invoices',
      :datatype => 'json',
      :mtype => 'GET',
      :colNames => ['Inv No','Date', 'Amount','Tax','Total','Notes'],
      :colModel  => [ 
        { :name => 'invid',   :index => 'invid',    :width => 55 }, 
        { :name => 'invdate', :index => 'invdate',  :width => 90 }, 
        { :name => 'amount',  :index => 'amount',   :width => 80,   :align => 'right' },
        { :name => 'tax',     :index => 'tax',      :width => 80,   :align => 'right' }, 
        { :name => 'total',   :index => 'total',    :width => 80,   :align => 'right' },
        { :name => 'note',    :index => 'note',     :width => 150,  :sortable => false } 
      ],
      :pager => '#invoices_pager',
      :rowNum => 10,
      :rowList => [10, 20, 30],
      :sortname => 'invid',
      :sortorder => 'desc',
      :viewrecords => true,
      :caption => 'My first grid',
      :onSelectRow => "function() { alert('Row selected!');}".to_json_var
    }

    jqgrid 'invoices_list', options, grid_options 
  end

end
