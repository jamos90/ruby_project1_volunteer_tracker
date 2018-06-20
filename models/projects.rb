require('pry')
require_relative('../db/sql_runner.rb')

class Project
  attr_accessor :name, :type, :location, :specialism_required, :age_requirement, :id, :capacity

  def initialize ( options )
    @id = options ['id'].to_i()
    @name = options ['name']
    @type = options ['type']
    @location = options ['location']
    @specialism_required = options ['specialism_required'] #this will be a string with "Counsoling" or nil
    @age_requirement = options ['age_requirement'].to_i()
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
      capacity
      )VALUES (
        $1,$2,$3,$4,$5,$6
        ) RETURNING *"
    values = [@name, @type, @location, @specialism_required, @age_requirement, @capacity]
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
      age_requirement,
      capacity
    ) =
    ($1,$2,$3,$4,$5,$6)
    WHERE id = $7"
    values = [@name, @type, @location, @specialism_required,@age_requirement,@capacity, @id]
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

  def is_empty?
    return true if @capacity == @capacity
    return false
  end

  def remove_volunteers()
    @capacity +=1
  end

  def add_volunteers()
    @capacity -= 1
  end
  #
  # def volunteer_total
  #   return @volunteers.length()
  # end

  def days()
    sql = "SELECT days.* FROM days
    INNER JOIN bookings
    ON bookings.day_id = days.id
    WHERE bookings.project_id = $1"
    values = [@id]
    day_results = SqlRunner.run(sql,values)
    return day_results.map {|day| Day.new(day)}
  end

  # def available_projects()
  #   @project = Project.all()
  #   return @project if !project.is_full?
  # end

  def self.filter_by_location(location_find)
    @projects = Project.all()
    filtered_projects = @projects.find_all {|project| project.location == location_find}
    return filtered_projects
  end

  def self.filter_by_specilism(specialism)
    @projects = Project.all()
    filtered_projects = @projects.find_all {|project| project.specialism == specialism}
  end

  def self.filter_by_name(name)
    @projects = Project.all()
    filtered_projects = @projects.find_all {|project| project.name == name}
  end

end
