require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd63lh31kggfenc', host: 'ec2-54-243-223-245.compute-1.amazonaws.com', port: 5432, user: 'sgnomzbviqrnmi', password: '550a7bb87ca4b08ccf641d7f405319ac5e05db788c66c4e4d6fda57c667ce1f0'})
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )

    ensure
      db.close() if db != nil
    end
    return result
  end

end
