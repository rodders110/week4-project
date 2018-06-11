require_relative('models/stock')
require_relative('models/manufacturer')
require_relative('models/inventory')

require('pry')


sweets = [{'name' => "Acid Drops"}, {'name' => 'Aniseed Balls'}, {'name' => 'American Hard Gums'},
{'name' => 'Apple Bon Bons'}, {'name' => 'Berwick Cockles'}, {'name' => 'Black Jacks'}, {'name' => 'Brown Mice'},
{'name' => 'White Mice'}]

sweets.each {|sweet| Stock.new(sweet).save()}

places = [{'name' => 'Alodmack Ltd', 'address' => 'Giffnock'}, {'name' => 'CandyCo of Troon', 'address' => 'Irvine'},
{'name' => 'Gordon & Durwood', 'address' => 'Creiff'}, {'name' => 'Drysdale & Gibb Ltd', 'address' => 'Greenock'}]

places.each {|place| Manufacturer.new(place).save()}

lists = [{'stock_id' => '1', 'manufacturers_id' => '1', 'volume' => '100'},
{'stock_id' => '3', 'manufacturers_id' => '1', 'volume' => '100'},
{'stock_id' => '2', 'manufacturers_id' => '2', 'volume' => '98'},
{'stock_id' => '4', 'manufacturers_id' => '2', 'volume' => '96'},
{'stock_id' => '5', 'manufacturers_id' => '3', 'volume' => '144'},
{'stock_id' => '7', 'manufacturers_id' => '3', 'volume' => '132'},
{'stock_id' => '6', 'manufacturers_id' => '4', 'volume' => '94'},
{'stock_id' => '8', 'manufacturers_id' => '4', 'volume' => '83'}]

lists.each {|list| Inventory.new(list).save()}
