require_relative('../models/volunteers.rb')
also_reload( '../models/*' )

get '/volunteers' do
  @volunteers = Volunteer.all()
  erb(:"volunteer/index")
end
