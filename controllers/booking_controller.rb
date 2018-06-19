require('pry')
require_relative('../models/bookings.rb')
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb(:"booking/index")
end

get '/bookings/new' do
  erb(:"booking/new")
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  erb(:'booking/show')
end

post '/bookings' do
  @booking = Booking.new(params)
  @booking.save()
  redirect to '/bookings'
end

get '/bookings/:id/edit' do
  @booking = Booking.find(params['id'])
  erb(:'booking/edit')
end

post '/project/:id' do
  Booking.new(params).update
  redirect to '/bookings'
end

post '/bookings/:id/delete' do
  booking = Booking.find(params['id'])
  booking.delete()
  redirect to '/bookings'
end
