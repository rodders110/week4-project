require('minitest/autorun')
require('minitest/rg')
require('pry')
require_relative('../models/stock')

class StockTest < Minitest::Test

  def test_find_all()
    result = Stock.find_all()
    answer = result[6].name

    assert_equal("Brown Mice",answer)
  end

  # def test_save()
  #   stock = Stock.new({'id' => 'nil', 'name' => 'Penny Chews'})
  #   # binding.pry
  #   stock.save()
  #   assert_equal('Penny Chews', Stock.find_all[8].name)
  # end

  # def test_update()
  #
  #   stock = Stock.find_all[8]
  #   stock.name = 'Pair Drops'
  #   stock.update()
  #   # binding.pry
  #
  #   assert_equal('Pair Drops', Stock.find_all[8].name)
  #
  # end
  #
  # def test_delete()
  #
  #   stock = Stock.find_all[8]
  #   stock.delete()
  #
  #   assert_equal(8, Stock.find_all().length())
  #
  # end

  def test_find()
    stock = Stock.find_all[0]
    answer = stock.find_manufacturer()[0]

    assert_equal("Alodmack Ltd", answer.name)

  end


end
