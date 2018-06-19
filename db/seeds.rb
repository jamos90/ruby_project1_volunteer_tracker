require('pry')
require_relative('../models/projects.rb')
require_relative('../models/volunteers.rb')
require_relative('../models/bookings.rb')
require_relative('../models/special_project.rb')
require_relative('../models/special_booking.rb')

Booking.delete()
Project.delete()
Volunteer.delete()

project1 = Project.new({
  'name' => 'Edinburgh Homeless',
  'type' => 'Donation sorting',
  'location' => 'Edinburgh',
  'specialism_required' => 'none',
  'age_requirement' => 18,
  'capacity' => 10
  })

  project1.save()

project2 = Project.new({
  'name' => 'Edinburgh Drug Rehab',
  'type' => 'Counsoling',
  'location' => 'Edinburgh',
  'specialism_required' => 'Consuling experience',
  'age_requirement' => 18,
  'capacity' => 0

  })
  project2.save()

project3 = Project.new({
  'name' => 'Edinburgh Homeless',
  'type' => 'Donation sorting',
  'location' => 'Edinburgh',
  'specialism_required' => 'none',
  'age_requirement' => 18,
  'capacity' => 10
  })

  project4 = Project.new({
    'name' => 'Glasgow Homeless',
    'type' => 'Donation collection',
    'location' => 'Glasgow',
    'specialism_required' => 'none',
    'age_requirement' => 16,
    'capacity' => 10
    })

  project4.save()

  special_project1 = SpecialProject.new({
    'name' => 'Glasgow Homeless',
    'type' => 'Donation collection',
    'location' => 'Glasgow',
    'specialism_required' => 'none',
    'age_requirement' => 16,
    'capacity' => 10
    })

    special_project1.save()

  volunteer1 = Volunteer.new({
    'name' => 'James',
    'specialism' => 'Architecture',
    'age' => 18
    })


  volunteer1.save()

  volunteer2 = Volunteer.new({
    'name' => 'Jess',
    'specialism' => 'Counsoling',
    'age' => 18
    })
  volunteer2.save()

  volunteer3 = Volunteer.new({
    'name' => 'Joe',
    'specialism' => 'First Aid',
    'age' => 18
      })
  volunteer3.save()


  booking1 = Booking.new({
    'project_id'   => project1.id,
    'volunteer_id' => volunteer1.id
    })

    booking1.save()

  booking2 = Booking.new({
    'project_id'   => project1.id,
    'volunteer_id' => volunteer2.id
    })

    booking2.save()

  binding.pry

  nil
