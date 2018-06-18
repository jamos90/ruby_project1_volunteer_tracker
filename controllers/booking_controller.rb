require('pry')
require_relative('../models/bookings.rb')
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all()
  erb(:"booking/index")
end
