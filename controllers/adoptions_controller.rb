require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/pet.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )

get '/adoptions' do
  @adoptions = Adoption.all
  erb (:"adoptions/index")
end

# get '/owners/:id' do
#   @owner = Owner.find(params['id'].to_i)
#   erb(:"owners/show")
# end
