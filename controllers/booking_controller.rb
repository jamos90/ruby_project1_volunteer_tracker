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
