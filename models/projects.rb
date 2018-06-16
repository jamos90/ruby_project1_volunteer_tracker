require_relative('../db/sql_runner.rb')

class Project
  attr_reader :name, :type, :location, :specilsm_required

  def initialize ( options )
    @id = options ['id']
    @name = options ['name']
    @type = options ['type']
    @location = options ['location']
    @specilsm_required = options ['specilsm_required']
  end

  def save()
    sql = "INSERT INTO projects
    (
      name,
      type,
      location,
      specilsm_required
      )VALUES (
        $1,$2,$3,$4
        ) RETURNING *"
    values = [@name, @type, @location, @specilsm_required]
    result = SqlRunner.run(sql,values)
    id = result.first['id']
    @id = id
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

end
