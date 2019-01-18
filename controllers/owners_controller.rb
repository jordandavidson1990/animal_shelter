require( 'sinatra' )
require( 'sinatra/contrib/all' )if development?
require_relative( '../models/owner.rb' )


get "/owners" do
  @owners = Owner.all()
  erb(:"owners/index")
end

get "/owners/new" do
  @adoptions = Adoption.all()
  erb(:"owners/new")
end

post "/owners" do
  @owner = Owner.new(params)
  @owner.save()
  erb(:"owners/create")
end

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  erb(:"owners/show")
end

get '/owners/:id/edit' do
  @adoptions = Adoption.all()
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

post "/owners/:id/edit" do
  @owner = Owner.new(params)
  @owner.update()
  erb(:"owners/update")
end

post "/owners/:id/delete" do
  @owner = Owner.find(params['id'].to_i)
  @owner.delete()
  erb(:"owners/delete")
end
