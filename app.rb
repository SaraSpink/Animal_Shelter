require ("sinatra")
require ("pry")
require ("sinatra/reloader")
also_reload(".lib/**/*.rb")
require ("./lib/animal")
require("./lib/owner")
require ("pg")

DB = PG.connect({:dbname => "animal_shelter_test"})

get('/') do
  erb(:index)
end

get('/pet') do
  @new_animal = Animal.all()
  erb(:pet)
end

post('/pet') do
  @new_animal = Animal.all()
  new_pet = Animal.new({:name => params.fetch("name"), :gender => params.fetch("gender"), :admittance_date => params.fetch("admittance_date"), :type => params.fetch("type"), :breed => params.fetch("breed")})
  new_pet.save
  @new_animal = Animal.all()
  erb(:pet)
end

get('/owner') do
  @new_owner = Owner.all()
  erb(:owner)
end

post('/owner') do
  @new_owner = Owner.all()
  new_client = Owner.new({:name => params.fetch("name"), :phone => params.fetch("phone"), :type => params.fetch("type"), :breed => params.fetch("breed")})
  new_client.save
  @new_owner = Owner.all()
  erb(:owner)
end
