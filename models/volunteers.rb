require_relative("../db/sql_runner.rb")

class Volunteer

  attr_reader :name, :specilsm, :age

  def initialize (options)
    @id = options ['id'].to_i()
    @name = options ['name']
    @specilsm = options ['specilsm']
    @age = options ['age'].to_i()
  end

  def save()
    sql = "INSERT INTO volunteers
    (
      name,
      specilsm,
      age
      ) VALUES (
        $1, $2, $3
        ) RETURNING *"
    values = [@name, @specilsm, @age]
    resluts = SqlRunner.run(sql, values)
    id = resluts.first['id']
    @id = id.to_i()
  end

  def self.all()
    sql = "SELECT * FROM volunteers"
    volunteer_data = SqlRunner.run(sql)
    return volunteer_data.map {|volunteer| Volunteer.new(volunteer)}
  end

  def self.delete()
    sql = "DELETE FROM volunteers"
    volunteer_date = SqlRunner.run(sql)
  end


end
