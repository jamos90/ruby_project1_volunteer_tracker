require('pry')
require_relative('../models/projects.rb')
require_relative('../models/volunteers.rb')

project1 = Project.new({
  'name' => 'Edinburgh Homeless',
  'type' => 'Donation sorting',
  'location' => 'Edinburgh',
  'specilsm_required' => 'none'
  })

  project1.save()

  volunteer1 = Volunteer.new({
    'name' => 'James',
    'specilsm' => 'Architecture'
    })

  volunteer1.save()

  binding.pry

  nil
