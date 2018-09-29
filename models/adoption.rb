require_relative('../db/sql_runner')
require('pry')

class Adoption

  attr_reader :id, :pet_id, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pet_id = options['pet_id']
    @owner_id = options['owner_id']
  end


  def save()
    sql = "INSERT INTO adoptions
    (pet_id, owner_id)
    values ($1, $2) RETURNING *"
    values = [@pet_id, @owner_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run(sql)
    return results.map{|adoption|Adoption.new(adoption)}
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

end
