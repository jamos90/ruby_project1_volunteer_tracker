require_relative("../db/sql_runner.rb")

class Volunteer

  attr_accessor :name, :specilsm, :age, :id

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

  def find_by_id(id)
   sql = "SELECT * FROM volunteers WHERE id = $1"
   values = [id]
   volunteer_data = SqlRunner.run(sql, values).map {|volunteer| Volunteer.new(volunteer)}
   return volunteer_data.first()
  end

  def update()
    sql = "UPDATE volunteers SET (
      name,
      specilsm,
      age
      ) =
      ($1,$2,$3)
       WHERE id = $4"
    values = [@name, @specilsm, @age, @id]
    SqlRunner.run(sql,values)
  end

  def projects()
    sql = "SELECT projects.* FROM projects
    INNER JOIN bookings
    ON bookings.project_id = projects.id
    WHERE volunteer_id = $1"
    values = [@id]
    resluts = SqlRunner.run(sql, values)
    return resluts.map {|project| Project.new(project)}
  end





end
