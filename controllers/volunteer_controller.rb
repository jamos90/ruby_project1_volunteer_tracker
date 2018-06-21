require_relative('../models/volunteers.rb')
also_reload('../models/*')

get '/volunteers' do
  @volunteers = Volunteer.all()
  erb(:"volunteer/index")
end

get '/volunteers/new' do
   erb(:"volunteer/new")
 end

get '/volunteers/:id' do
  @volunteer = Volunteer.find(params['id'])
  @volunteer_images = ["/volunteer_images/model_1.jpg","/volunteer_images/profile.jpg", "/volunteer_images/vietnam_1.jpg"]
  erb(:'volunteer/show')
end

post '/volunteers' do
   Volunteer.new(params).save()
   redirect to '/volunteers'
end

get '/volunteers/:id/edit' do
  @volunteer = Volunteer.find(params['id'])
  erb(:'volunteer/edit')
end

post '/volunteers/:id' do
  Volunteer.new(params).update
  redirect to '/volunteers'
end

post '/volunteers/:id/delete' do
  volunteer = Volunteer.find(params['id'])
  volunteer.delete()
  redirect to '/volunteers'
end
