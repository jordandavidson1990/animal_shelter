require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/pets_controller')


get '/' do
  erb( :index )
end
