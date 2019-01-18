require( 'sinatra' )
require( 'sinatra/contrib/all' )if development?
require_relative('controllers/pets_controller')
require_relative('controllers/owners_controller')
require_relative('controllers/adoptions_controller')
require_relative('controllers/contact_controller')



get '/' do
  erb( :index )
end
