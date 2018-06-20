require_relative('../db/sql_runner.rb')

class Day
  attr_accessor :day, :id

  def initialize(options)
    @id = options['id'].to_i()
    @day = options['day']
  end

  def save()
    sql = "INSERT INTO days (
       day
      ) VALUES
      (
        $1
      ) RETURNING *"
      values = [@day]
      day_results = SqlRunner.run(sql,values)
      id = day_results.first['id']
      @id = id.to_i()
  end

  def self.delete()
    sql = "DELETE FROM days"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM days"
    return SqlRunner.run(sql).map {|day| Day.new(day)}
  end



end
