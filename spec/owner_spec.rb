require ("rspec")
require ("pg")
require ("pry")
require ("owner")
# require("spec_helper")

DB = PG.connect({:dbname => 'animal_shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM owner *;")
  end
end

describe(Owner) do
  describe(".all") do
    it("is empty at first") do
      expect(Owner.all()).to(eq([]))
    end
  end


  describe("#save") do
    it("adds an owner to the array of saved potential owners") do
      test_owner = Owner.new({:name => "Abby", :phone => "503-333-3300", :type => "cat", :breed => "tabby"})
      test_owner.save()
      expect(Owner.all()).to(eq([test_owner]))
    end
  end

  describe("#name") do
    it("lets you read the name of potential owner") do
      test_owner = Owner.new({:name => "Karla", :phone => "828-275-1199", :type => "Dog", :breed => "Pointer"})
      test_owner.save()
      expect(test_owner.name()).to(eq("Karla"))
    end
  end

  describe("#phone") do
    it("lets you read the phone number of potential owner") do
      test_owner = Owner.new({:name => "Karla", :phone => "828-275-1199", :type => "Dog", :breed => "Pointer"})
      test_owner.save()
      expect(test_owner.phone()).to(eq("828-275-1199"))
    end
  end

  describe("#type") do
    it("lets you read the type of pet desired by potential owner") do
      test_owner = Owner.new({:name => "Karla", :phone => "828-275-1199", :type => "Dog", :breed => "Pointer"})
      test_owner.save()
      expect(test_owner.type()).to(eq("Dog"))
    end
  end

  describe("#breed") do
    it("lets you read the breed of choice of potential owner") do
      test_owner = Owner.new({:name => "Karla", :phone => "828-275-1199", :type => "Dog", :breed => "Pointer"})
      test_owner.save()
      expect(test_owner.breed()).to(eq("Pointer"))
    end
  end

  describe("#==") do
    it("matches owner input") do
      owner1 = Owner.new({:name => "Abby", :phone => "503-333-3300", :type => "cat", :breed => "tabby"})
      owner2 = Owner.new({:name => "Abby", :phone => "503-333-3300", :type => "cat", :breed => "tabby"})
      expect(owner1).to(eq(owner2))
    end
  end

  describe(".all") do
    it("orders by breed choice") do
      owner1 = Owner.new({:name => "Karla", :phone => "828-275-1199", :type => "Dog", :breed => "Pointer"})
      owner1.save()
      owner2 = Owner.new({:name => "Ollie", :phone => "111-222-4435", :type => "Dog", :breed => "Labrador"})
      owner2.save()
      expect(Owner.all).to(eq([owner2, owner1]))
    end
  end
end
