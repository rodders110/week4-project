require('sinatra')
require('sinatra/contrib/all')if development?
require_relative('models/inventory')
require_relative('models/stock')
also_reload('models/*')

get '/' do
  erb(:index)
end

get '/inventory' do
  @stock = Inventory.find_all()
  erb(:inventory)
end

get '/list-stock' do
  @stock = Stock.find_all()
  erb(:stock)
end

get '/list-manufacturers' do
  @manufacturers = Manufacturer.find_all()
  erb(:manufacturers)
end

get '/:id/edit'do
  item = Inventory.find(params[:id])
  @entry = Inventory.new(item)
  @stock = Stock.find_all()
  @manufacturers = Manufacturer.find_all()
  erb(:edit_inventory)
end

get '/new-stock' do
  erb(:new_stock)
end

get '/new-manufacturer' do
  erb(:new_manufacturer)

end

get '/new-to-inventory' do
  @stock = Stock.find_all()
  @manufacturers = Manufacturer.find_all()
  erb(:new_to_inventory)
end

post '/:id/delete' do
  item = Inventory.find(params[:id])
  entry = Inventory.new(item)
  entry.delete()
  redirect to '/inventory'
end

post '/:id/stock-delete' do
  item = Stock.find(params[:id])
  entry = Stock.new(item)
  entry.delete()
  redirect to '/list-stock'
end

post '/:id/manufacturer-delete' do
  item = Manufacturer.find(params[:id])
  entry = Manufacturer.new(item)
  entry.delete()
  redirect to '/list-manufacturers'
end

post '/:id/update' do
  @entry = Inventory.new(params).update
  redirect to '/inventory'

end


post '/stock-edit' do
  @stock = Stock.new(params)
  @stock.save()
  redirect to '/list-stock'
end

post '/manufacturer-edit' do
  @manufacturer = Manufacturer.new(params)
  @manufacturer.save()
  redirect to '/list-manufacturers'
end

post '/save-to-inventory' do
  @entry = Inventory.new(params).save()
  redirect to '/inventory'

end
