require( 'sinatra' )
require( 'sinatra/contrib/all' )if development?
require_relative( '../models/pet.rb' )


get "/pets" do
  @pets = Pet.all()
  @distinct_type = Pet.distinct_type()
  @distinct_breed = Pet.distinct_breed()
  @distinct_status = Pet.distinct_status()
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

get "/pets/search" do
  @pets = Pet.find_by_breed(params['breed'])
  erb (:"pets/search")
end

post "/pets/search" do
  @pets = Pet.find_by_breed(params['breed'])
  erb (:"pets/search")
end

get "/pets/type_search" do
  @pets = Pet.find_by_type(params['type'])
  erb (:"pets/type_search")
end

post "/pets/type_search" do
  @pets = Pet.find_by_type(params['type'])
  erb (:"pets/type_search")
end

get "/pets/status_search" do
  @pets = Pet.find_by_status(params['status'])
  erb(:"pets/status_search")
end

post "/pets/status_search" do
  @pets = Pet.find_by_status(params['status'])
  erb(:"pets/status_search")
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
