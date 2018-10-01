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

  def pet()
    sql = "SELECT * FROM pets
    WHERE id = $1"
    values = [@pet_id]
    results = SqlRunner.run( sql, values )
    return Pet.new( results.first )
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  # def delete()
  #   sql = "DELETE FROM adoptions WHERE id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql,values)
  # end


  def self.find(id)
    sql ="SELECT * FROM adoptions where
    id = $1"
    values =[id]
    results = SqlRunner.run(sql, values)
    return Adoption.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

end
