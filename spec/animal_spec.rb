require("rspec")
require("pg")
require("pry")
require("animal")

DB = PG.connect({:dbname => 'animal_shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animal *;")
  end
end

describe(Animal) do
  describe(".all") do
    it("starts off with no lists") do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds an animal to the array of saved animals") do
      test_animal = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

  describe("#==") do
    it("matches animal input") do
      animal1 = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      animal2 = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      expect(animal1).to(eq(animal2))
    end
  end

end
