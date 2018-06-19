require_relative('../db/sql_runner')

class SpecialBooking

  attr_reader :project_id, :volunteer_id, :id

  def initialize (options)
    @id = options['id'].to_i()
    @special_project_id = options ['project_id'].to_i()
    @volunteer_id = options ['volunteer_id'].to_i()
  end

  def save()
    sql = "INSERT INTO special_bookings(
    special_project_id,
    volunteer_id
    ) VALUES(
      $1,$2
      )RETURNING *"
    values = [@project_id, @volunteer_id]
    booking_results = SqlRunner.run(sql,values)
    id = booking_results.first['id']
    @id = id.to_i()
  end

  def self.delete()
    sql = "DELETE FROM special_bookings"
    SqlRunner.run(sql)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM special_bookings WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM special_bookings"
    results = SqlRunner.run(sql)
    return results.map {|booking| SpecialBooking.new(booking)}
  end

  def self.find(id)
    sql = "SELECT * FROM special_bookings WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql,values).map {|booking| SpecialBooking.new(booking)}
    return results.first()
  end


  def project()
    sql = "SELECT * FROM special_projects WHERE id = $1"
    values = [@project_id]
    project = SqlRunner.run(sql, values).first
    return SpecialProject.new(project)
  end

  def volunteer()
    sql = "SELECT * FROM volunteers WHERE id = $1"
    values = [@volunteer_id]
    volunteer = SqlRunner.run(sql, values).first
    return Volunteer.new(volunteer)
  end



end
