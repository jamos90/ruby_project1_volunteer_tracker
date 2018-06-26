require('pry')
require_relative('../models/bookings.rb')
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb(:"booking/index")
end

get '/bookings/new' do
  @projects = Project.all
  @volunteers = Volunteer.all
  @days = Day.all
  erb(:"booking/new")
end

post '/bookings' do
  @booking = Booking.new(params)
  @project = Project.find(params['project_id'])
  @volunteer =
  Volunteer.find(params['volunteer_id'])
  @day = Day.find(params['day_id'])
  if (!@project.is_full? && @volunteer.age >= @project.age_requirement) && (@project.specialism_required == @volunteer.specialism || @project.specialism_required == 'General Volunteer') 
    @project.add_volunteers()
    @booking.save()
    @project.update()
  else
    redirect to '/bookings/error'
  end
  redirect to '/bookings'
end

get '/bookings/error' do
  erb(:'booking/error')
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  erb(:'booking/show')
end

get '/bookings/:id/edit' do
  @booking = Booking.find(params['id'])
  @projects = Project.all()
  @volunteers = Volunteer.all()
  @days = Day.all()
  erb(:'booking/edit')
end

post '/project/:id' do
  Booking.new(params).update
  redirect to '/bookings'
end

post '/bookings/:id/delete' do
  booking = Booking.find(params['id'])
  @project = Project.find(booking.project_id)
  # if !@project.is_empty
  @project.remove_volunteers

  booking.delete()
  @project.update()

# end
  redirect to '/bookings'
end
require('pry')
require_relative('../models/bookings.rb')
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb(:"booking/index")
end

get '/bookings/new' do
  @projects = Project.all
  @volunteers = Volunteer.all
  @days = Day.all
  erb(:"booking/new")
end

post '/bookings' do
  @booking = Booking.new(params)
  @project = Project.find(params['project_id'])
  @volunteer =
  Volunteer.find(params['volunteer_id'])
  @day = Day.find(params['day_id'])
  if (!@project.is_full? && @volunteer.age >= @project.age_requirement) && (@project.specialism_required == @volunteer.specialism || @project.specialism_required == 'General Volunteer')
    @project.add_volunteers()
    @booking.save()
    @project.update()
  else
    redirect to '/bookings/error'
  end
  redirect to '/bookings'
end

get '/bookings/error' do
  erb(:'booking/error')
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  erb(:'booking/show')
end

get '/bookings/:id/edit' do
  @booking = Booking.find(params['id'])
  @projects = Project.all()
  @volunteers = Volunteer.all()
  @days = Day.all()
  erb(:'booking/edit')
end

post '/project/:id' do
  Booking.new(params).update
  redirect to '/bookings'
end

post '/bookings/:id/delete' do
  booking = Booking.find(params['id'])
  @project = Project.find(booking.project_id)
  # if !@project.is_empty
  @project.remove_volunteers

  booking.delete()
  @project.update()

# end
  redirect to '/bookings'
end
