require('pry')
require_relative('../models/projects.rb')
require_relative('../models/volunteers.rb')

Project.delete()
Volunteer.delete()

project1 = Project.new({
  'name' => 'Edinburgh Homeless',
  'type' => 'Donation sorting',
  'location' => 'Edinburgh',
  'specilsm_required' => 'none'
  })

  project1.save()

project2 = Project.new({
  'name' => 'Edinburgh Drug Rehab',
  'type' => 'Counsoling',
  'location' => 'Edinburgh',
  'specilsm_required' => 'Consuling experience'
  })
  project2.save()

project3 = Project.new({
  'name' => 'Edinburgh Homeless',
  'type' => 'Donation sorting',
  'location' => 'Edinburgh',
  'specilsm_required' => 'none'
  })

  project3.save()

  volunteer1 = Volunteer.new({
    'name' => 'James',
    'specilsm' => 'Architecture'
    })
  volunteer1.save()

  volunteer2 = Volunteer.new({
    'name' => 'Jess',
    'specilsm' => 'Counsoling'
    })
  volunteer2.save()

  volunteer3 = Volunteer.new({
    'name' => 'Joe',
    'specilsm' => 'First Aid'
      })
  volunteer3.save()

  binding.pry

  nil
