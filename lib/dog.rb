class Dog
  attr_accessor :name, :breed
  attr_reader :id


  def initialize(id: nil, name:, breed:)
    @id, @name, @breed = id, name, breed
  end

  # def self.create_table
  #   sql = <<-SQL
  #   CREATE TABLE dogs(
  #   id INTEGER PRIMARY KEY,
  #   name TEXT,
  #   breed TEXT
  #   );
  #   SQL
  #   db[:conn].execute(sql)
  # end

end
