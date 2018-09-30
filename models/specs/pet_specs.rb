require("minitest/autorun")
require('minitest/rg')
require_relative("../pet.rb")

class TestPet < MiniTest::Test

  def setup
    options = {"id" => 1, "name" => "Walter",
      "age" => 4, "type" => "dog", "breed" => "dalmation", "admission_date" => "25/12/99", "status" => "available"}

    @pet9 = Pet.new(options)
  end

  def test_name()
    result = @pet9.name()
    assert_equal("Walter", result)
  end
end
