require'pry'
class Dog
  attr_accessor :name, :breed
  attr_reader :id


  def initialize(id: nil, name:, breed:)
    @id, @name, @breed = id, name, breed
  end

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS dogs(
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT
    );
    SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
    DROP TABLE IF EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
    INSERT INTO dogs (name, breed) VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid()")[0][0]
    return self
  end

  def self.create(hash)
    new_dog = Dog.new(hash)
    new_dog.save
    new_dog
  end

  def xfer_to_hash(array)
    hash = {}
    hash[:id] = array[0]
    hash[:name] = array[1]
    hash[:breed] = array[2]
    return hash
  end

  def self.find_by_id(id)
    sql = <<-SQL
    SELECT * FROM dogs WHERE id = ?
    SQL
    dog = DB[:conn].execute(sql, id)[0]

    new_dog = Dog.new()
  end

end
