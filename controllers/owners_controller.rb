require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )


get "/owners" do
  @owners = Owner.all()
  erb(:"owners/index")
end
