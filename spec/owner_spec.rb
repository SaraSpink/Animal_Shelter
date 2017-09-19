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

    describe("#==") do
      it("is the same task if it has the same description and list ID") do
        owner1 = Owner.new({:name => "Abby", :phone => "503-333-3300", :type => "cat", :breed => "tabby"})
        owner2 = Owner.new({:name => "Abby", :phone => "503-333-3300", :type => "cat", :breed => "tabby"})
        expect(owner1).to(eq(owner2))
      end
    end
end
