class Category
  attr_reader(:name, :id)

  define_method(:initialize)do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_categories.each() do |category|
      name = category.fetch("name")
      id = category.fetch("id").to_i() # The information comes out of the database as a string.
      categories.push(Task.new({:name => name, :id => id}))
    end
    tasks
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (name,id) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

end
