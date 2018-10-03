require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
also_reload( '../models/*' )

get '/contact' do
  erb (:"contact/index")
end
