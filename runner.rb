require('pry')
require_relative('models/inventory')
require_relative('models/manufacturer')
require_relative('models/stock')

query1 = Stock.find_all()
query2 = Manufacturer.find_all()
query3 = Inventory.find_all()

binding.pry
nil
