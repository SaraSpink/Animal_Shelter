require ("sinatra")
require ("pry")
require ("sinatra/reloader")
also_reload(".lib/**/*.rb")
require ("./lib/animal")
require("./lib/owner")
require ("pg")

DB = PG.connect({:dbname => "animal_shelter_test"})
