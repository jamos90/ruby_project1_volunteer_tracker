require('pry')
require_relative('../models/day')
also_reload( '../models/*' )

get '/days' do
  @dayss = Day.all()
  erb(:"day/index")
end
