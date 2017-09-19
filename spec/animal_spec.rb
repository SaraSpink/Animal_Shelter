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

  describe("#name") do
    it("lets you read the name of pet") do
      test_animal = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      test_animal.save()
      expect(test_animal.name()).to(eq("Dixie"))
    end
  end

  describe("#gender") do
    it("lets you read the gender of pet") do
      test_animal = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      test_animal.save()
      expect(test_animal.gender()).to(eq("Female"))
    end
  end

  describe("#type") do
    it("lets you read the type of pet") do
      test_animal = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      test_animal.save()
      expect(test_animal.type()).to(eq("Dog"))
    end
  end

  describe("#breed") do
    it("lets you read the breed of pet") do
      test_animal = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      test_animal.save()
      expect(test_animal.breed()).to(eq("Pointer"))
    end
  end

  describe("#admittance_date") do
    it("lets you read the admittance date of pet") do
      test_animal = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      test_animal.save()
      expect(test_animal.admittance_date()).to(eq("2017-05-30"))
    end
  end

  describe("#==") do
    it("matches animal input") do
      animal1 = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      animal2 = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-05-30", :type => "Dog", :breed => "Pointer"})
      expect(animal1).to(eq(animal2))
    end
  end

  describe(".all") do
    it("orders by admittance_date") do
      animal1 = Animal.new({:name => "Dixie", :gender => "Female", :admittance_date => "2017-07-30", :type => "Dog", :breed => "Pointer"})
      animal1.save()
      animal2 = Animal.new({:name => "Ollie", :gender => "Male", :admittance_date => "2017-07-04", :type => "Dog", :breed => "Poodle"})
      animal2.save()
      expect(Animal.all).to(eq([animal2, animal1]))
    end
  end
end
