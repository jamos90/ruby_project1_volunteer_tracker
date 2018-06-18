require('pry')
require_relative('../models/projects')
also_reload( '../models/*' )

get '/projects' do
  @projects = Project.all()
  erb(:"project/index")
end

get  '/projects/new' do
  erb(:"project/new")
end

post '/projects' do
  Project.new(params).save()
  redirect to '/projects'
end

get "/projects/:id/edit" do
  @project = Project.find(params['id'])
  erb(:"project/edit")
end
