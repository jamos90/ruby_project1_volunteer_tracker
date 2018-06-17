require_relative('../db/sql_runner.rb')

class Project
  attr_accessor :name, :type, :location, :specilsm_required, :age_requirement, :id

  def initialize ( options )
    @id = options ['id'].to_i()
    @name = options ['name']
    @type = options ['type']
    @location = options ['location']
    @specilsm_required = options ['specilsm_required']
    @age_requirement = options ['age_requirment'].to_i()
  end

  def save()
    sql = "INSERT INTO projects
    (
      name,
      type,
      location,
      specilsm_required,
      age_requirement
      )VALUES (
        $1,$2,$3,$4,$5
        ) RETURNING *"
    values = [@name, @type, @location, @specilsm_required, @age_requirement]
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

  def update()
    sql = "UPDATE projects SET(
      name,
      type,
      location,
      specilsm_required,
      age_requirement
    ) =
    ($1,$2,$3,$4,$5)
    WHERE id = $6"
    values = [@name, @type, @location, @specilsm_required,@age_requirement, @id]
    SqlRunner.run(sql,values)
  end

  def volunteers()
    sql = "SELECT volunteers.* FROM volunteers
    INNER JOIN bookings
    ON bookings.volunteer_id = volunteers.id
    WHERE projects_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    return results.map {|volunteer| Volunteer.new(volunteer)}
  end

end
