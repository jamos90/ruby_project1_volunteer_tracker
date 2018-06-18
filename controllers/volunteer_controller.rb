require_relative('../models/volunteers.rb')
also_reload( '../models/*' )

get '/volunteers' do
  @volunteers = Volunteer.all()
  erb(:"volunteer/index")
end

get '/volunteers/new' do
   erb(:"volunteer/new")
 end

 post '/volunteers' do
   Volunteer.new(params).save()
   redirect to '/volunteers'
end
