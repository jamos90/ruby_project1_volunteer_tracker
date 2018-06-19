require('pry')
require_relative('../db/sql_runner.rb')

class Project
  attr_accessor :name, :type, :location, :specialism_required, :age_requirement, :id, :capacity

  def initialize ( options )
    @id = options ['id'].to_i()
    @name = options ['name']
    @type = options ['type']
    @location = options ['location']
    @specialism_required = options ['specialism_required']
    @age_requirement = options ['age_requirement'].to_i()
    # @volunteer_list = options['volunteer_list']
    @capacity = options ['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO projects
    (
      name,
      type,
      location,
      specialism_required,
      age_requirement,
      volunteer_list,
      capacity
      )VALUES (
        $1,$2,$3,$4,$5,$6,$7
        ) RETURNING *"
    values = [@name, @type, @location, @specialism_required, @age_requirement,@volunteer_list, @capacity]
    result = SqlRunner.run(sql,values)
    id = result.first['id']
    @id = id.to_i()
  end

  def self.all()
    sql = "SELECT * FROM projects"
    project_data = SqlRunner.run(sql)
    return project_data.map {|project| Project.new(project)}
  end

  def self.delete()
    sql = "DELETE FROM projects"
    project_delete = SqlRunner.run(sql)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM projects WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM projects WHERE id = $1"
    values = [id]
    project = SqlRunner.run(sql,values)
    array = project.map {|project| Project.new(project)}
    return array[0]
  end

  def update()
    sql = "UPDATE projects SET(
      name,
      type,
      location,
      specialism_required,
      age_requirement
    ) =
    ($1,$2,$3,$4,$5,$6,$7)
    WHERE id = $8"
    values = [@name, @type, @location, @specialism_required,@age_requirement,@volunteer_list,@capacity, @id]
    SqlRunner.run(sql,values)
  end

  def volunteers()
    sql = "SELECT volunteers.* FROM volunteers
    INNER JOIN bookings
    ON volunteers.id = bookings.volunteer_id
    WHERE project_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    return results.map {|volunteer| Volunteer.new(volunteer)}
  end

  def delete()
    sql = "DELETE FROM projects WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  def is_full?
    return true if @capacity == 0
    return false
  end

  def add_volunteers()
    @capacity -= 1
  end
  #
  # def volunteer_total
  #   return @volunteers.length()
  # end

end
