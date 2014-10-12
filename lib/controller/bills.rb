class BillyBones
  get '/' do
    @bills = Bill.all(order: [:date.desc])
    haml :bills
  end
  
  get '/bills/new' do
    @bill = Bill.new
    @cat_id = (params[:category].to_i) || 0
    @action = 'new'
    haml :bill_new do
      haml :_bill_form
    end
  end
  
  get '/bills/:id/edit' do
    @bill = Bill.get(params[:id])
    @cat_id = @bill.category.id
    @action = "#{@bill.id}"
    haml :bill_edit do
      haml :_bill_form
    end
  end
  
  post '/bills/new' do
    @bill = Bill.new
    Helpers.update_params(@bill, params)
    Environment.logger.debug params
    Environment.logger.debug @bill
    Environment.logger.debug @bill.errors
    redirect to("/category/#{params[:category_id]}")
  end
  
  post '/bills/:id' do |bill_id|
    @bill = Bill.get(bill_id)
    Helpers.update_params(@bill, params)
    redirect to("/category/#{@bill.category_id}")
  end
end
