require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?

get '/contact' do
  erb (:"contact/index")
end
