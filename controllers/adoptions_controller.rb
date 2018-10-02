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

get "/adoptions/new" do
  @owners = Owner.all
  @pets = Pet.status_available()
  erb(:"adoptions/new")
end

post "/adoptions" do
  adoption = Adoption.new(params)
  pet = Pet.find(params['pet_id'].to_i)
  pet.status = "Happily Adopted"
  pet.update()
  adoption.save()
  redirect to("/adoptions")
end

get '/adoptions/:id' do
  @adoption = Adoption.find(params['id'].to_i)
  erb(:"adoptions/show")
end

get '/adoptions/:id/new' do
  @adoptions = Adoption.all()
  erb(:"adoptions/new")
end
#
# post "/adoptions/:id/delete" do
#   @adoption = Adoption.find(params['id'].to_i)
#   @pet = @adoption.pet
#   @adoption.
#   @adoption.delete()
#   erb(:"adoption/delete")
# end
