require('minitest/autorun')
require_relative('../volunteers.rb')

class TestVolunteer < MiniTest::Test
  def setup
    options = {'name' => 'James','specialism' => 'Architecture'}
    @volunteer1 = Volunteer.new(options)
  end

  def test_attributes
    assert_equal("James", @volunteer1.name())
    assert_equal("Architecture", @volunteer1.specialism())

  end

end
