require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/pet.rb' )
also_reload( '../models/*' )


get "/pets" do
  @pets = Pet.all()
  @distinct_breed = Pet.distinct_breed()
  erb(:"pets/index")
end

get "/pets/new" do
  @adoptions = Adoption.all()
  erb(:"pets/new")
end

post "/pets" do
  @pet = Pet.new(params)
  @pet.save()
  erb(:"pets/create")
end

get "/pets/breed_search" do
  @pets = Pet.find_by_breed(params['breed'])
  erb (:"pets/breed_search")
end

post "/pets/breed_search" do
  @pets = Pet.find_by_breed(params['breed'])
  erb (:"pets/breed_search")
end

get '/pets/:id' do
  @pet = Pet.find(params['id'].to_i)
  erb(:"pets/show")
end

get '/pets/:id/edit' do
  @adoptions = Adoption.all()
  @pet = Pet.find(params[:id])
  erb(:"pets/edit")
end

post "/pets/:id/edit" do
  @pet = Pet.new(params)
  @pet.update()
  erb(:"pets/update")
end

post "/pets/:id/delete" do
  @pet = Pet.find(params['id'].to_i)
  @pet.delete()
  erb(:"pets/delete")
end
