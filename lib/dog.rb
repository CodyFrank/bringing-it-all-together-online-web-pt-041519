class Dog
  attr_accessor :name, :breed
  attr_reader :id
  def initialize(id: nil, name:, breed:)
    @id, @name, @breed = id, name, breed
  end


end
