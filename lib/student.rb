class Student

  attr_accessor :name, :grade
  attr_reader :id

  def initialize (id=nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<- SQL
      CREATE TABLE IF NOT EXISTS student (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade INTEGER)
        SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE student;"
    DB[:conn].execute(sql)
  end

  def self.save
    sql = <<- SQL
      INSERT INTO student(name, grade)
      VALUES (?, ?);
      SQL
    DB[:conn].execute(sql)
  end

  def self.create(name:, grade:)
    new_student = Student.new(name, grade)
    new_student.save
    new_student
  end

end
