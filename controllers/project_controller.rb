require('pry')
require_relative('../models/projects')
also_reload( '../models/*' )

get '/projects' do
  @projects = Project.all()
  erb(:"project/index")
end

get '/projects/new' do
  erb(:"project/new")
end

get "/projects/:id/add" do
@projects = Project.find(params['id'])
@volunteers = Volunteer.find(params['id'])
erb(:"project/add")
end

get "/projects/:id/volunteers" do
  @project = Project.find(params['id'])
  @volunteers = @project.volunteers()
  erb(:'project/volunteers')
end

get '/projects/:id' do
  @project = Project.find(params['id'])
  erb(:"project/show")
end


post '/projects' do
   Project.new(params).save()
  redirect to '/projects'
end


get "/projects/:id/edit" do
  @project = Project.find(params['id'])
  erb(:"project/edit")
end

post "/projects/:id" do
  Project.new( params ).update
  redirect to "/projects/#{params['id']}"
end

post "/projects/:id/delete" do
  project = Project.find(params['id'])
  project.delete()
  redirect to "/projects"
end
