require_relative('../db/sql_runner.rb')

class Project
  attr_accessor :name, :type, :location, :specilsm_required, :age_requirment, :id

  def initialize ( options )
    @id = options ['id'].to_i()
    @name = options ['name']
    @type = options ['type']
    @location = options ['location']
    @specilsm_required = options ['specilsm_required']
    @age_requirment = options ['age_requirment'].to_i()
  end

  def save()
    sql = "INSERT INTO projects
    (
      name,
      type,
      location,
      specilsm_required,
      age_requirment
      )VALUES (
        $1,$2,$3,$4,$5
        ) RETURNING *"
    values = [@name, @type, @location, @specilsm_required, @age_requirment]
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

end
