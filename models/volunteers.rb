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


end
