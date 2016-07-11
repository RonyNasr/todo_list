require ('spec_helper')

describe ('Category') do
  describe('#name') do
    it ("returns the name of the category")do
      test_category = Category.new({:name => "Errands to run", :id => nil})
      expect(test_category.name()).to(eq("Errands to run"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      test_category = Category.new({:name => "Errands to run", :id => nil})
      test_category.save()
      expect(test_category.id()).to(be_an_instance_of(Fixnum))
    end
  end


end
