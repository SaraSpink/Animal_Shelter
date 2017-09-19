class Animal
  attr_accessor(:name, :gender, :admittance_date, :type, :breed)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @admittance_date = attributes.fetch(:admittance_date)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
  end

  
end
