require_relative('../db/sql_runner')
class Pet

  attr_accessor :name, :age, :type, :breed, :status, :admission_date
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @type = options['type']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @status = options['status']
  end

  def save()
    sql = "INSERT INTO pets
    (name, age, type, breed, admission_date, status)
    values ($1, $2, $3, $4, $5, $6) RETURNING *"
    values = [@name, @age, @type, @breed, @admission_date, @status]
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

  def self.find_by_breed(breed)
    sql = "SELECT * FROM pets
    WHERE breed = $1"
    values = [breed]
    results = SqlRunner.run(sql, values)
    return results.map { |pets| Pet.new( pets ) }
  end

  def self.distinct_breed()
    sql = "SELECT DISTINCT breed FROM pets"
    results = SqlRunner.run( sql )
    return results.map { |pets| Pet.new( pets ) }
  end

  def self.find_by_type(type)
    sql = "SELECT * FROM pets
    WHERE type = $1"
    values = [type]
    results = SqlRunner.run(sql, values)
    return results.map { |pets| Pet.new( pets ) }
  end

  def self.distinct_type()
    sql = "SELECT DISTINCT type FROM pets"
    results = SqlRunner.run( sql )
    return results.map { |pets| Pet.new( pets ) }
  end

  def self.find_by_status(status)
    sql = "SELECT * FROM pets
    WHERE status = $1"
    values = [status]
    results = SqlRunner.run(sql, values)
    return results.map { |pets| Pet.new( pets ) }
  end

  def self.distinct_status()
    sql = "SELECT DISTINCT status FROM pets"
    results = SqlRunner.run( sql )
    return results.map { |pets| Pet.new( pets ) }
  end

  def self.delete_all
    sql = "DELETE FROM pets"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE pets SET (name, age, type, breed, admission_date, status) =
    ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @age, @type, @breed, @admission_date, @status, @id]
    SqlRunner.run(sql,values)
  end

  def self.status_available
    sql = "SELECT * FROM pets WHERE status = $1"
    values = ['Looking for a New Home']
    results = SqlRunner.run( sql, values )
    return results.map { |pets| Pet.new( pets ) }
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def owners()
    sql = "SELECT o.* FROM owners o INNER JOIN adoptions a ON a.owner_id = o.id WHERE
    a.pet_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |owner| Owner.new(owner) }
  end

end
