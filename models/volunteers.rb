require_relative("../db/sql_runner.rb")

class Volunteer

  attr_reader :name, :specilsm

  def initialize (options)
    @id = options ['id']
    @name = options ['name']
    @specilsm = options ['specilsm']
  end

  def save()
    sql = "INSERT INTO volunteers
    (
      name,
      specilsm
      ) VALUES (
        $1, $2
        ) RETURNING *"
    values = [@name, @specilsm]
    resluts = SqlRunner.run(sql, values)
    id = resluts.first['id']
    @id = id
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
