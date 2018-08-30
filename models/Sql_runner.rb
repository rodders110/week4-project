require('pg')

class SqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect ({dbname: 'da74bq6l589363', host: 'ec2-54-83-51-78.compute-1.amazonaws.com', port: 5432, user: 'cscdkosdgnulnh', password: '03aa4a3ae41d420d16c286105da26388bfed41d53763b1b53fe83210f650e8fb'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end
end
