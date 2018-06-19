require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/project_controller')
require_relative('controllers/volunteer_controller')
require_relative('controllers/booking_controller')
also_reload( './models/*' )

get '/' do
  erb(:index)
end
