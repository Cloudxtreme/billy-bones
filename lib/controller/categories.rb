class BillyBones
  get '/category/new' do
    @category = Category.new
    @action = 'new'
    haml :category_new do
      haml :_category_form
    end
  end
  
  post '/category/new' do
    @category = Category.new
    Helpers.update_params(@category, params)
    redirect to("/category/#{@category.id}")
  end
  
  post '/category/:id' do |cat_id|
    @category = Category.get(cat_id)
    Helpers.update_params(@category, params)
    redirect to("/category/#{@category.id}")
  end
  
  get '/category/:id' do |cat_id|
    @category = Category.get(cat_id)
    @bills = @category.bills
    haml :category_show do
      haml :bills
    end
  end
  
  get '/category/:id/edit' do |cat_id|
    @category = Category.get(cat_id)
    @action = "#{@category.id}"
    haml :category_edit do
      haml :_category_form
    end
  end
end
