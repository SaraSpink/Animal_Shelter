class Owner
  attr_accessor(:name, :phone, :type, :breed)


    def initialize(attributes)
      @name = attributes.fetch(:name)
      @phone = attributes.fetch(:phone)
      @type = attributes.fetch(:type)
      @breed = attributes.fetch(:breed)

    end

    def self.all
    returned_owners = DB.exec("SELECT * FROM owner")
    owners = []
    returned_owners.each() do |owner|
      name = owner.fetch("name")
      phone = owner.fetch("phone")
      type = owner.fetch("type")
      breed = owner.fetch("breed")

      owners.push(Owner.new({:name => name, :phone => phone, :type => type, :breed => breed}))
    end
    owners
  end

  def save
    DB.exec("INSERT INTO owner (name, phone, type, breed) VALUES ('#{@name}', '#{@phone}', '#{@type}', '#{@breed}');")
  end

  def ==(another_owner)
    self.name().==(another_owner.name()).&(self.phone().==(another_owner.phone())).&(self.type().==(another_owner.type())).&(self.breed().==(another_owner.breed()))
  end

end
