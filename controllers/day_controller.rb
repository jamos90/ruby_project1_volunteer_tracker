require('pry')
require_relative('../models/day')
also_reload( '../models/*' )

get '/days' do
  @days = Day.all()
  erb(:"day/index")
end

get '/days/:id' do
@days = Day.find(params['id'])
erb(:'day/show')
end
