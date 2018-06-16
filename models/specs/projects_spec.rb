require('minitest/autorun')
require_relative('../projects.rb')

class TestProject < MiniTest::Test
  def setup
    options = {'name' => 'Edinburgh Homeless', 'type' => 'Donation sorting','location' => 'Edinburgh','specilsm_required' => 'none'}
    @project1 = Project.new(options)

  end

  def test_attributes()
    assert_equal('none',@project1.specilsm_required())
    assert_equal('Edinburgh Homeless',@project1.name())
  end

end
