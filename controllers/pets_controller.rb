require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/pet.rb' )
also_reload( '../models/*' )


get "/pets" do
  @pets = Pet.all()
  erb(:"pets/index")
end

get '/pets/:id' do
  @pet = Pet.find(params['id'].to_i)
  erb(:"pets/show")
end
