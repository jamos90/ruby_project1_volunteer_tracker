require_relative('../models/projects')

get '/projects' do
  @projects = Project.all()
  erb(:"project/index")
end
