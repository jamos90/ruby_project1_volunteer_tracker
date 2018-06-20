require('pry')
require_relative('../models/projects.rb')
require_relative('../models/volunteers.rb')
require_relative('../models/bookings.rb')
require_relative('../models/special_project.rb')
require_relative('../models/special_booking.rb')
require_relative('../models/day.rb')

Booking.delete()
Project.delete()
Volunteer.delete()
Day.delete()

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

  day1 = Day.new({
    'day' => 'Monday'
    })

  day1.save()

  day2 = Day.new({
  'day' => 'Tuesday'
   })

  day2.save()

  day3 = Day.new({
  'day' => 'Wednesday'
    })

  day3.save()

  day4 = Day.new({
    'day' => 'Thursday'
    })

    day4.save()

  day5 = Day.new({
    'day' => 'Friday'
    })

  day5.save()

  day6 = Day.new({
    'day' => 'Saturday'
    })

  day6.save()

  day7 = Day.new({
    'day' => 'Sunday'
    })

  day7.save()

  # booking1 = Booking.new({
  #   'project_id'   => project1.id,
  #   'volunteer_id' => volunteer1.id,
  #   'day_id'       => day1.id
  #   })
  #
  #   booking1.save()
  #
  # booking2 = Booking.new({
  #   'project_id'   => project1.id,
  #   'volunteer_id' => volunteer2.id,
  #   'day_id'       => day2.id
  #   })
  #
  #   booking2.save()
  #
  # booking3 = Booking.new({
  #   'project_id'   => project1.id,
  #   'volunteer_id' => volunteer2.id,
  #   'day_id'       => day3.id
  #   })
  #
  #     booking3.save()
  #
  # booking4 = Booking.new({
  #   'project_id'   => project1.id,
  #   'volunteer_id' => volunteer2.id,
  #   'day_id'       => day4.id
  #   })
  #
  #   booking4.save()

  binding.pry

  nil
