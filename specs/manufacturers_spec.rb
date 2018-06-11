require('minitest/autorun')
require('minitest/rg')
require('Pry')
require_relative('../models/manufacturer')

class ManTest < Minitest::Test

  def test_find_all

    item = Manufacturer.find_all[0]

    assert_equal('Alodmack Ltd', item.name)

  end

  # def test_update
  #   item = Manufacturer.find_all[0]
  #   item.name = "Willy Wonka"
  #   item.update()
  #   # binding.pry
  #   assert_equal('Willy Wonka', Manufacturer.find_all[3].name)
  #
  # end

  def test_find_inventory

    item = Manufacturer.find_all[3]
    answer = item.find_inventory[0]
    # binding.pry

    assert_equal("Black Jacks", answer['name'])

  end


end
