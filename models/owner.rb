require_relative('../db/sql_runner')
require('pry')

class Owner

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO owners
    (name)
    values ($1) RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def pets
  sql = "SELECT p.* FROM pets v INNER JOIN adoptions a ON a.pet_id = p.id WHERE a.owner_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |pet| Pet.new(pet) }
end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |owners| Owner.new( owners ) }
  end

  def self.find( id )
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE owners SET name = ($1)
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
  sql = "SELECT * FROM owners WHERE id = $1"
  values = [id]
  owner = SqlRunner.run(sql,values).first
  result = Owner.new(owner)
  return result
end

end
