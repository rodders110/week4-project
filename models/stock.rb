require_relative('Sql_runner')
require_relative('manufacturer')

class Stock

  attr_reader :id, :name
  attr_writer :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def self.find_all()
    sql = "SELECT * FROM stock"
    results = SqlRunner.run(sql)
    answer = results.map {|item| Stock.new(item)}
    return answer
  end

  def save()
    sql = "INSERT INTO stock (name) values ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE stock SET (item_name) = ROW($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM stock"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM stock WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM  stock WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results[0]
  end

  def find_manufacturer()
    sql = "SELECT manufacturers.* FROM inventory INNER JOIN manufacturers on inventory.manufacturers_id = manufacturers.id WHERE inventory.stock_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    answer = result.map {|manufacturer| Manufacturer.new(manufacturer)}
    return answer
  end

  def self.find_stock()

    sql = "select stock.id, stock.item_name, manufacturers.name, inventory.volume from stock inner join inventory on stock.id = inventory.stock_id inner join manufacturers on inventory.manufacturers_id = manufacturers.id"
    result = SqlRunner.run(sql)
    return result
  end
end
