require_relative('../models/volunteers.rb')

get '/volunteers' do
  @volunteers = Volunteer.all()
  erb(:"volunteer/index")
end
