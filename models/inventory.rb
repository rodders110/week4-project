require_relative('Sql_runner')
require_relative('stock')
require_relative('manufacturer')

class Inventory

  attr_reader :id, :stock_id, :manufacturers_id, :volume

  def initialize(options)
    @id = options['id'].to_i
    @stock_id = options['stock_id'].to_i
    @manufacturers_id = options['manufacturers_id'].to_i
    @volume = options['volume'].to_i
  end

  def save()
    sql = "INSERT INTO inventory (stock_id, manufacturers_id, volume) VALUES ($1, $2, $3) RETURNING id"
    values = [@stock_id, @manufacturers_id, @volume]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE inventory SET (stock_id, manufacturers_id, volume) = ($1, $2, $3) WHERE id = $4"
    values = [@stock_id, @manufacturers_id, @volume, @id]
    SqlRunner.run(sql, values)
  end

  def find_stock()
    sql = "select * from stock where id = $1"
    values = [@stock_id]
    result = SqlRunner.run(sql, values)
    return Stock.new(result.first)
  end

  def find_manufacturer()
    sql = "select * from manufacturers where id = $1"
    values = [@manufacturers_id]
    result = SqlRunner.run(sql, values)
    return Manufacturer.new(result.first)

  end

  def self.find_all()
    sql = "SELECT * FROM inventory"
    results = SqlRunner.run(sql)
    answer = results.map {|result| Inventory.new(result)}
    return answer
  end

  def self.delete_all()
    sql = "DELETE from inventory"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "delete from inventory where id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM inventory WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return results[0]
  end
end
