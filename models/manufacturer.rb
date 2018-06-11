require_relative('Sql_runner')
require_relative('inventory')

class Manufacturer

  attr_reader :id, :name, :address
  attr_writer :name, :address

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
  end


  def save()
    sql = "INSERT INTO manufacturers (name, address) VALUES ($1, $2) RETURNING id"
    values = [@name, @address]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE manufacturers SET (name, address) = ($1, $2) WHERE id = $3"
    values = [@name, @address, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

  def self.find_all()
    sql = "SELECT * FROM manufacturers"
    results = SqlRunner.run(sql)
    answer = results.map {|result| Manufacturer.new(result)}
    return answer
  end

  def delete(id)
    sql = "DELETE FROM manufacturers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def find()
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    answer = results.map {|result| Manufacturer.new(result)}
    return answer
  end

  def find_inventory()
    sql = "SELECT inventory.*, stock.* FROM inventory INNER JOIN stock ON stock.id = inventory.stock_id WHERE manufacturers_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results
  end
end
