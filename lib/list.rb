class List
  attr_reader(:name,:category_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @category_id = attributes.fetch(:category_id)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i()
      category_id = list.fetch("category_id").to_i()
      lists.push(List.new({:name => name,:category_id => category_id, :id => id}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name,category_id) VALUES ('#{@name}', #{@category_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_list|
    self.name().==(another_list.name()).&(self.id().==(another_list.id())).&(self.category_id().==(another_list.category_id()))
  end
end
