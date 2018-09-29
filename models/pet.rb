require_relative('../db/sql_runner')
require('pry')
class Pet

  attr_accessor :name, :age, :type, :breed, :admission_date
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
    # @available = options['']
  end

  def save()
    sql = "INSERT INTO pets
    (name, age, type, breed, admission_date)
    values ($1, $2, $3, $4, $5) RETURNING *"
    values = [@name, @age, @type, @breed, @admission_date]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM pets"
    results = SqlRunner.run( sql )
    return results.map { |pets| Pet.new( pets ) }
  end

  def self.find( id )
    sql = "SELECT * FROM pets
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Pet.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM pets"
    SqlRunner.run( sql )
  end

  def update()
  sql = "UPDATE pets SET (name, age, type, breed, admission_date)
  values ($1, $2, $3, $4, $5)
 ($1) WHERE id = $6 "
  values = [@name, @age, @type, @breed, @admission_date, @id]
  SqlRunner.run(sql,values)
end

def delete()
  sql = "DELETE FROM pets WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql,values)
end

  # def available
  #   if pet in @pets
  #     pet.availability == true
  #     return pet
  #   end
  # end
end
