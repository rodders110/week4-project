require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../models/inventory')

class InventoryTest < Minitest::Test

  def test_find_all

    item = Inventory.find_all[0]

    assert_equal(100, item.volume)

  end

  


end
