require('pry')
require_relative('../db/sql_runner.rb')

class SpecialProject

  attr_accessor :name, :type, :specialism_required, :age_requirement,:capacity

  def initialize ( options )
    @id = options['id']
    @name = options['name']
    @type = options['type']
    @location = options['location']
    @specialism_required = options['specialism_required']
    @age_requirement = options['age_requirement']
    @capacity = options[capacity].to_i()
  end

  def save()
    sql = "INSERT INTO special_projects
    (
      name,
      type,
      location,
      specialism_required,
      age_requirement,
      capacity
      ) VALUES (
      $1,$2,$3,$4,$5,$6
        ) RETURNING *"
    values = [@name, @type, @location, @specialism_required, @age_requirement, @capacity]
    result = SqlRunner.run(sql,values)
    id = result.first['id']
    @id = id.to_i()
  end

  def self.all()
    sql = "SELECT * FROM special_projects"
    project_data = SqlRunner.run(sql)
    return project_data.map{|project| Project.new(project)}
  end

  def self.delete()
    sql = "DELETE FROM special_projects"
    SqlRunner.run(sql)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM special_projects WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM special_projects WHERE id = $1"
    values = [id]
    project = SqlRunner.run(sql,values)
    array = project.map{|project| Project.new(project)}
    return array[0]
  end

  def update()
    sql = "UPDATE special_projects SET
    (
    name,
    type,
    location,
    specialism_required,
    age_requirement,
    capacity
    ) =
    ($1,$2,$3,$4,$5,$6)
    WHERE id = $7"
    values =[@name, @type, @location, @specialism_required, @age_requirement, @capacity,@id]
    SqlRunner.run(sql,values)
  end

  def volunteers()
    sql = "SELECT volunteers.* FROM volunteers
    INNER JOIN special_bookings
    ON volunteers.id = special_bookings.volunteer_id
    WHERE special_projects_id = $1"
    values = [@id]
    results = SqlRunner.run(sql,values)
    return results.map {|volunteer| Volunteer.new(volunteer)}
  end


end
