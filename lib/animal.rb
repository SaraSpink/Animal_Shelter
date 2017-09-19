class Animal
  attr_accessor(:name, :gender, :admittance_date, :type, :breed)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @admittance_date = attributes.fetch(:admittance_date)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
  end

  def self.all
  returned_animals = DB.exec("SELECT * FROM animal ORDER BY admittance_date;")
  animals = []
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      admittance_date = animal.fetch("admittance_date")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      animals.push(Animal.new({:name => name, :gender => gender, :admittance_date => admittance_date, :type => type, :breed => breed}))
    end
    animals
  end

  def save
    DB.exec("INSERT INTO animal (name, gender, admittance_date, type, breed) VALUES ('#{@name}', '#{@gender}', '#{@admittance_date}', '#{@type}', '#{@breed}');")
  end

  def ==(another_animal)
    self.name().==(another_animal.name()).&(self.gender().==(another_animal.gender())).&(self.admittance_date().==(another_animal.admittance_date())).&(self.type().==(another_animal.type())).&(self.breed().==(another_animal.breed()))
  end
end
